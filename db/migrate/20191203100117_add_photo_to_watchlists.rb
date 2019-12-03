class AddPhotoToWatchlists < ActiveRecord::Migration[5.2]
  def change
    add_column :watchlists, :photo, :string
  end
end
