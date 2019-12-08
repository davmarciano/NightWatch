class AddBackgroundToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :background, :string
  end
end
