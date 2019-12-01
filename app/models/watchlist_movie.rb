class WatchlistMovie < ApplicationRecord
  belongs_to :movies
  belongs_to :watchlist
end
