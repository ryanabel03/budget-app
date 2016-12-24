class ChargesController < ApplicationController
  def index
    puts params.inspect
    @charges = Charge.order(transaction_date: :desc).page params[:page]
  end
  def import
    if request.post?
      ChargeRepository.parse_and_create_charges(params[:charges])
      charge = ChargeRepository.next_unprocessed_charge
      redirect_to edit_charge_path(charge)
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
    nxt = ChargeRepository.next_unprocessed_charge
    redirect_to edit_charge_path(nxt)
  end
end
