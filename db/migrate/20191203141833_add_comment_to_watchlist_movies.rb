class AddCommentToWatchlistMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :watchlist_movies, :comment, :string
  end
end
