class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :watchlist_movies

  validates :title, uniqueness: true
end
