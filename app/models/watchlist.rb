class Watchlist < ApplicationRecord
  belongs_to :user
  acts_as_followable
end
