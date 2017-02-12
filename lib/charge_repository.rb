class ChargeRepository
  def self.parse_and_create_charges(charge_arr)
    charge_arr.each do |charge_row|
      date = Date.strptime(charge_row[2], "%m/%d/%Y")
      amount = charge_row[4].to_f * -1
      description = charge_row[3].strip
      Charge.create!(transaction_date: date, description: description, amount: amount)
    end
  end

  def self.next_unprocessed_charge
    Charge.unprocessed.order(transaction_date: :asc).first
  end
end
