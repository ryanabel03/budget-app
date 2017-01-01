class CategoryPresenter
  def init(category)
    @category = category
  end

  def charge_total_for_year(year)
    Charge.in_year(year).processed.where(category: @category).sum(:amount)
  end
end
