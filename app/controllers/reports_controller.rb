class ReportsController < ApplicationController
  def year
    @year = params[:year]
    charges = Charge.includes(:category).in_year(@year.to_i)
    @charge_set = ChargeSet.new(charges: charges)
  end
end
