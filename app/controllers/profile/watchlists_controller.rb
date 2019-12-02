class Profile::WatchlistsController < ApplicationController
  render layout: 'application_white'
  def index
    @watchlists = Watchlist.all
  end

  def home
    @movies = current_user.movies
    @watchlists = current_user.watchlists
  end
end
