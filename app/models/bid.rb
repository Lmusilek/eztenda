class Bid < ApplicationRecord
  # REFERENCES
  belongs_to :user
  belongs_to :drinks_opportunity
  # VALIDATIONS

  validates :contract, presence: true
  validates :price, presence: true
  validates :notes, presence: true
end
