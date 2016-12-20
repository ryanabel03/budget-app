class ChargeRepository
  def self.parse_and_create_charges(charge_str)
    charge_str.split("\n").each do |charge|
      parts = /(\d+)\/(\d+)(.*?)(\d*\.\d+)/.match(charge)
      date = Date.new(2016, parts[1].to_i, parts[2].to_i)
      Charge.create!(transaction_date: date, description: parts[3], amount: parts[4])
    end
  end

  def self.next_unprocessed_charge
    Charge.unprocessed.order(transaction_date: :asc).first
  end
end
