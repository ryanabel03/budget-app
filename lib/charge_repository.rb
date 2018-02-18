class ChargeRepository
  def self.parse_and_create_charges(charge_arr, two_digit_year:, importer:)
    charge_arr.each do |charge_row|
      year = if two_digit_year
               '%y'
             else
               '%Y'
             end
      date = Date.strptime(charge_row[2], "%m/%d/#{year}")
      amount = charge_row[4].to_f * -1
      description = charge_row[3].strip
      Charge.create!(transaction_date: date,
                     description: description,
                     for: importer,
                     amount: amount)
    end
  end

  def self.next_unprocessed_charge
    Charge.unprocessed.order(transaction_date: :asc).first
  end
end
