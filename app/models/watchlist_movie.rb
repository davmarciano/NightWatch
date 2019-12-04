class WatchlistMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :watchlist, dependent: :destroy
end
