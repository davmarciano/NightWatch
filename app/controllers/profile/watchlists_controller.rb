class Profile::WatchlistsController < ApplicationController
  layout 'application_white'

  def index
    @watchlists = Watchlist.all
  end


end
