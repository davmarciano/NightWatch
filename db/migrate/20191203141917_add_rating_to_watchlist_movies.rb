class AddRatingToWatchlistMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :watchlist_movies, :rating, :integer
  end
end
