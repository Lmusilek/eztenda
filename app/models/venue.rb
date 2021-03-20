class Venue < ApplicationRecord
  has_many :bids, through: :drinks_opportunity
  belongs_to :user
  has_many :drinks_opportunities
end
