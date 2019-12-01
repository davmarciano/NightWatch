class CreateWatchlistMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :watchlist_movies do |t|
      t.references :movies, foreign_key: true
      t.references :watchlist, foreign_key: true

      t.timestamps
    end
  end
end
