class WatchlistsMoviesController < ApplicationController
  def new
  end

  def create
    params["watchlist_movie"]["watchlist_ids"].each do |watchlist_id|
      @watchlist_movie = WatchlistMovie.new(watchlist_movie_params)
      @watchlist_movie.watchlist_id = watchlist_id unless watchlist_id == ""
      if @watchlist_movie.save
        Review.create(content: @watchlist_movie.comment,
          rating: @watchlist_movie.rating,
          movie_id: @watchlist_movie.movie_id,
          user_id: current_user.id)
      end
    end

    respond_to do |format|
      format.html { redirect_to movies_path } # we do not really expect html, but only JS
      format.js  # <-- idem
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @watchlist = Watchlist.find(params[:watchlist])
    @watchlist_movie = WatchlistMovie.find_by(movie: @movie, watchlist: @watchlist)
    @watchlist_movie.destroy
    redirect_to watchlist_path(@watchlist)
  end

  private

  def watchlist_movie_params
    params.require(:watchlist_movie).permit(:comment, :rating, :watchlist_ids, :movie_id)
  end
end
