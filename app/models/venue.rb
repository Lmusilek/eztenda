class Venue < ApplicationRecord
  # REFERENCES
  has_many :bids, through: :drinks_opportunity
  belongs_to :user
  has_many :drinks_opportunities
  # VALIDATIONS
  validations :venue_name, presence: true
  validations :description, presence: true
  validations :region, presence: true
  validations :city, presence: true
  validations :post_code, presence: true
end
