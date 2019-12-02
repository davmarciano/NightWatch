class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
  end

  def follow
  end
end
