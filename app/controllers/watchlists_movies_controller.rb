class WatchlistsMoviesController < ApplicationController
  def new
  end

  def create
    @watchlist_movie = WatchlistMovie.new(watchlist_movie_params)
    @movie = Movie.find(params[:watchlist_movie][:movie])
    @watchlist = Watchlist.find(params[:watchlist_movie][:watchlist])
    @watchlist_movie.movie = @movie
    @watchlist_movie.watchlist = @watchlist
    if @watchlist_movie.save
      Review.create(content: @watchlist_movie.comment,
                    rating: @watchlist_movie.rating,
                    movie_id: @watchlist_movie.movie_id,
                    user_id: current_user.id)
      redirect_to movies_path
    else
      flash[:alert] = "Sorry, something went wrong."
      render :new, layout: 'application_purple'
    end
  end

  private

  def watchlist_movie_params
    params.require(:watchlist_movie).permit(:comment, :rating)
  end

end
