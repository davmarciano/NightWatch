class Watchlist < ApplicationRecord
  belongs_to :user
  acts_as_followable
  has_many :movies, through: :watchlist_movies
end
