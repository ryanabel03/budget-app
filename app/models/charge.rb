class Charge < ActiveRecord::Base
  paginates_per 50
  belongs_to :category
  scope :unprocessed, -> { where(processed: false) }
  scope :in_year, -> (year) { where('transaction_date >= ? AND transaction_date < ?', Date.new(year), Date.new(year + 1)) }
end
