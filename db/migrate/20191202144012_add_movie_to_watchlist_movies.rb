class AddMovieToWatchlistMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :watchlist_movies, :movie,  foreign_key: true
  end
end
