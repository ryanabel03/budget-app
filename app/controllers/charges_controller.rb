class ChargesController < ApplicationController
  def index
    @charges = Charge.order(transaction_date: :desc).page params[:page]
  end
  def import
    if request.post?
      raw_charges = CSV.read(params[:file].path, headers: true)
      ChargeRepository.parse_and_create_charges(raw_charges)
      go_to_next_or_home
    end
  end

  def edit
    @charge = Charge.find(params[:id]) 
    @categories = Category.all
  end

  def update
    @charge = Charge.find(params[:id])
    permitted = params.require(:charge).permit(:category_id).merge(processed: true)
    @charge.update_attributes(permitted)
    go_to_next_or_home
  end

  def destroy
    @charge = Charge.find(params[:id])
    @charge.destroy
    go_to_next_or_home
  end

  private

  def go_to_next_or_home
    nxt = ChargeRepository.next_unprocessed_charge
    if nxt
      redirect_to edit_charge_path(nxt)
    else
      redirect_to report_year_path(year: Date.today.year)
    end
  end
end
