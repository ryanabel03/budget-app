class ReportsController < ApplicationController
  def year
    @year = params[:year]
    charges = Charge.processed.includes(:category).in_year(@year.to_i)
    @charge_sets = []
    Category.all.map do |category|
      @charge_sets << ChargeSet.new(category: category, charges: charges.where(category: category))
    end
  end

  def category_year
    @category = Category.find_by(name: params[:category])
    @year = params[:year]
    @charges = Charge.processed.in_year(@year.to_i).where(category: @category).order(transaction_date: :desc)
    @charge_set = ChargeSet.new(charges: @charges, category: @category)
    @months = @charge_set.months
  end
end
