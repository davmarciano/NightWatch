class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
    render layout: 'application_white'
  end

  def follow
  end
end
