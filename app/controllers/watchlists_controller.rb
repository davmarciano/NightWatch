class WatchlistsController < ApplicationController
  def index
   @watchlists = Watchlist.all
  end
end
