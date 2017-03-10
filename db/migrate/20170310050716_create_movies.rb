class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :starring
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
