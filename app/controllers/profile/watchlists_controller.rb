class Profile::WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
  end

  def home
    @test = 0
    @movies = current_user.movies
    @watchlists = current_user.watchlists
  end
end
