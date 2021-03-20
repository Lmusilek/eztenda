class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :drinks_opportunities
end
