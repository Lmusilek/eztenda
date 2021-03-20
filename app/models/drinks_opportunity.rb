class DrinksOpportunity < ApplicationRecord
  has_one :drink
  belongs_to :venue
  belongs_to :bid
end
