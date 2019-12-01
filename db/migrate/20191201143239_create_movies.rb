class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :genres
      t.string :directors
      t.string :actors
      t.string :plot
      t.string :language
      t.string :poster
      t.string :type

      t.timestamps
    end
  end
end
