class Profile::WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
  end

  def home
    @movies = current_user.movies
    @watchlists = current_user.watchlists
  end
end
