class ChargeSet
  def initialize(charges: [], category:)
    @charges = charges
    @category = category
  end

  def category_name
    @category.name
  end

  def spent
    @charges.sum(:amount)
  end

  def months
    @charges.order(transaction_date: :asc).inject({}) do |memo, charge|
      month_name = charge.transaction_date.strftime("%B")
      existing = memo[month_name]
      if existing
        memo[month_name][:spent] += charge.amount
      else
        memo[month_name] = {}
        memo[month_name][:index] = charge.transaction_date.month
        memo[month_name][:spent] = charge.amount
      end
      memo
    end
  end

  def budgeted
    latest_charge = @charges.order(transaction_date: :desc).first
    oldest_charge = @charges.order(transaction_date: :desc).last
    if oldest_charge && latest_charge
      latest_date = latest_charge.transaction_date
      oldest_date = oldest_charge.transaction_date
      months_between = (latest_date.year * 12 + latest_date.month) - (oldest_date.year * 12 + oldest_date.month)
      @category.limit + @category.limit * months_between
    else
      0
    end
  end

  def difference
    budgeted - spent
  end

  def over_budget?
    difference < 0
  end
end
