class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watchlist_movies
  has_many :movies, through: :watchlist_movies

  acts_as_followable
end
