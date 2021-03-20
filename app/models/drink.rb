class Drink < ApplicationRecord
  belongs_to :drinks_opportunity
  validates :name, presence: true
end
