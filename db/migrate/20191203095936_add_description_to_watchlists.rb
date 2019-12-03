class AddDescriptionToWatchlists < ActiveRecord::Migration[5.2]
  def change
    add_column :watchlists, :description, :string
  end
end
