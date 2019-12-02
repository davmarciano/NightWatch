class Profile::WatchlistsController < ApplicationController
  render layout: 'application_white'
  def index
    @watchlists = Watchlist.all
    render layout: 'application_white'
  end

  def home
    @movies = current_user.movies
    @watchlists = current_user.watchlists
    render layout: 'application_white'
  end
end
