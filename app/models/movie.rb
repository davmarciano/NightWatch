class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :watchlist_movies
  include PgSearch::Model
  pg_search_scope :search_by_anything,
  against: [:title, :watchlist, :actor, :director, :genre],

  using: {
    tsearch: { prefix: true }
  }
end
