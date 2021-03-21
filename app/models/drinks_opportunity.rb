class DrinksOpportunity < ApplicationRecord
  # REFERENCES
  has_one :drink
  belongs_to :venue
  has_many :bids
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :quantity, presence: true
  validates :bottle_type, presence: true
end
