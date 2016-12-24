class ChargeSet
  def initialize(charges: [])
    @charges = charges
  end

  def by_category
    @charges.group_by { |c| c.category.try(:name) }
  end
end
