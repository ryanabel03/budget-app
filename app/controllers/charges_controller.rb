class ChargesController < ApplicationController
  def index
    @charges = Charge.order(transaction_date: :desc).page params[:page]
  end
  def import
    if request.post?
      unless params[:file].present?
        flash[:alert] = 'Please provide a file'
        render :import
        return
      end
      two_digit = params[:two_digit_year].present? && params[:two_digit_year] == 'yes'
      raw_charges = CSV.read(params[:file].path, headers: true)
      ChargeRepository.parse_and_create_charges(raw_charges, two_digit_year: two_digit)
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
    Charge.destroy(params[:id])
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
