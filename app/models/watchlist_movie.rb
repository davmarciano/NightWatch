class WatchlistMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :watchlist

  validates :movie, presence: true
  validates :watchlist, presence: true, uniqueness: { scope: :movie }
end
