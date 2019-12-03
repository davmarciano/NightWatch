class WatchlistsMoviesController < ApplicationController
  def new
  end

  def create
    @watchlist_movie = WatchlistMovie.new
    @movie = Movie.find(params[:watchlist_movie][:movie])
    @watchlist = Watchlist.find(params[:watchlist_movie][:watchlist])
    @watchlist_movie.movie = @movie
    @watchlist_movie.watchlist = @watchlist
    if @watchlist_movie.save
      redirect_to movies_path
    else
      flash[:alert] = "Sorry, something went wrong."
      render :new, layout: 'application_purple'
    end
  end

end
