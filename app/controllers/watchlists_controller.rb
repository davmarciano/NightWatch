class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
    render layout: 'application_white'
  end

  def follow
    set_watchlist
    if following?
      current_user.stop_following(@watchlist)
    else
      current_user.follow(@watchlist)
    end
  end

  private

  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
    authorize @watchlist
  end

  def following?
    current_user.follow?(@watchlist)
  end
end
