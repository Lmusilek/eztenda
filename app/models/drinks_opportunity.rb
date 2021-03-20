class DrinksOpportunity < ApplicationRecord
  has_one :drink
  belongs_to :venue
  has_many :bids
end
