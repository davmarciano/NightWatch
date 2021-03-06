class WatchlistsController < ApplicationController
  def index
    @watchlists = Watchlist.all
    render layout: 'application_white'
  end

  def show
    @watchlist = Watchlist.find(params[:id])
    @following = current_user.following?(@watchlist)
    @is_owner = current_user == @watchlist.user

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
      respond_to do |format|
        format.html { redirect_to watchlist_path(@watchlist) }
        format.js
      end
    else
    respond_to do |format|
      format.html { redirect_to watchlist_path(@watchlist) } # we do not really expect html, but only JS
      format.js  # <-- idem
    end
    end
  end

  def edit
    @watchlist = Watchlist.find(params[:id])
    render layout: 'application_white'
  end

  def update
    @watchlist = Watchlist.find(params[:watchlist_id])
    if @watchlist.update(params[:watchlist])
      respond_to do |format|
        format.html { redirect_to watchlist_path(@watchlist) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  def destroy
    @watchlist = Watchlist.find(params[:id])
    @watchlist.destroy
    redirect_to profile_path(current_user)
  end

  def follow
    @watchlist = Watchlist.find(params[:id])
    @following = current_user.following?(@watchlist)
    @is_owner = current_user == @watchlist.user
    unless @is_owner
      if @following
        current_user.stop_following(@watchlist)
      else
        current_user.follow(@watchlist)
      end
      redirect_to watchlist_path(@watchlist)
    end
  end

  private

  def set_watchlist
    @watchlist = Watchlist.find(params[:id])
    authorize @watchlist
  end

  def watchlist_params
    params.require(:watchlist).permit(:name, :description, :photo, :id)
  end
end
