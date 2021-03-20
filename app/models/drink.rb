class Drink < ApplicationRecord
  # REFERENCES
  belongs_to :drinks_opportunity
  # VALIDATIONS
  validates :type, presence: true
end
