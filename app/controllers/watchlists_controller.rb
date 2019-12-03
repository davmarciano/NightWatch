class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
    render layout: 'application_white'
  end

  def show
    @watchlist = Watchlist.find(params[:id])
    authorize @watchlist
    render layout: 'application_purple'
  end

  def new
    @watchlist = Watchlist.new
    render layout: 'application_white'
  end

  def create
    @watchlist = Watchlist.new(watchlist_params)
    @watchlist.user = current_user
    @watchlist.save
    if @watchlist.save
      redirect_to watchlist_path(@watchlist)
    else
      flash[:alert] = "Sorry, something went wrong."
      render :new, layout: 'application_white'
    end
  end

  def edit
    @watchlist = Watchlist.find(params[:watchlist_id])
  end

  def update
    @watchlist = Watchlist.find(params[:watchlist_id])
    @watchlist.update(params[:watchlist])
  end

  def destroy
    @watchlist = Watchlist.find(params[:watchlist_id])
    @watchlist.destroy
  end

  def follow
    @watchlist = Watchlist.find(params[:id])
    @following = current_user.following?(@watchlist)
    if @following
      current_user.stop_following(@watchlist)
    else
      current_user.follow(@watchlist)
    end
    redirect_to watchlist_path(@watchlist)
  end

  private

  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
    authorize @watchlist
  end

  def following?
    current_user.follow?(@watchlist)
  end

  def watchlist_params
    params.require(:watchlist).permit(:name, :description, :photo)
  end
end
