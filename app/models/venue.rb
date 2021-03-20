class Venue < ApplicationRecord
    # MAPBOX
  geocoded_by :post_code
  after_validation :geocode, if: :will_save_change_to_post_code?
  # PG SEARCH

  include PgSearch::Model
  pg_search_scope :search,
  against: [ :venue_name, :city, :region ],
  using: {
    tsearch: { prefix: true }
    }

  # REFERENCES
  has_many :bids, through: :drinks_opportunity
  belongs_to :user
  has_many :drinks_opportunities
  # VALIDATIONS
  has_one_attached :photo
  validates :venue_name, presence: true
  validates :description, presence: true
  validates :region, presence: true
  validates :city, presence: true
  validates :post_code, presence: true
end
