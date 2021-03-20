class DrinksOpportunity < ApplicationRecord
  belongs_to :drink
  belongs_to :venue
  belongs_to :bid
end
