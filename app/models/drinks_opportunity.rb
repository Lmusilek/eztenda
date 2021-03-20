class DrinksOpportunity < ApplicationRecord
  # REFERENCES
  has_one :drink
  belongs_to :venue
  belongs_to :bid
  # VALIDATIONS
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :quantity, presence: true
end
