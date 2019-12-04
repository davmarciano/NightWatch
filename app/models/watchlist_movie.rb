class WatchlistMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :watchlist
  belongs_to :watchlist, dependent: :destroy

  validates :movie, presence: true
  validates :watchlist, presence: true
end
