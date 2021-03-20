class Venue < ApplicationRecord
  # PG SEARCH
  #include PgSearch::Model
  #multisearchable against: [:venue_name, :city, :region]

  # REFERENCES
  has_many :bids, through: :drinks_opportunity
  belongs_to :user
  has_many :drinks_opportunities
  # VALIDATIONS
  validates :venue_name, presence: true
  validates :description, presence: true
  validates :region, presence: true
  validates :city, presence: true
  validates :post_code, presence: true
end
