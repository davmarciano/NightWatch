class WatchlistsMoviesController < ApplicationController
  def new
  end

  def create
    @watchlist_movie = WatchlistMovie.new(watchlist_movie_params)
    if params[:watchlist_movie][:movie].to_i > 0
      @movie = Movie.find(params[:watchlist_movie][:movie])
      @watchlist_movie.movie = @movie
    end

    if params[:watchlist_movie][:watchlist].to_i > 0
      @watchlist = Watchlist.find(params[:watchlist_movie][:watchlist])
      @watchlist_movie.watchlist = @watchlist
    end

    if @watchlist_movie.save
      Review.create(content: @watchlist_movie.comment,
        rating: @watchlist_movie.rating,
        movie_id: @watchlist_movie.movie_id,
        user_id: current_user.id)
    end

    respond_to do |format|
      format.html { redirect_to movies_path } # we do not really expect html, but only JS
      format.js  # <-- idem
    end
  end

  private

  def watchlist_movie_params
    params.require(:watchlist_movie).permit(:comment, :rating)
  end

end
