class Profile::WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
  end

  def home
    @test = "test"
  end
end
