class RemoveMoviesFromWatchlistMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :watchlist_movies, :movies_id, :reference
  end
end
