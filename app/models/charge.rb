class Charge < ActiveRecord::Base
  belongs_to :category
  scope :unprocessed, -> { where(processed: false) }
end
