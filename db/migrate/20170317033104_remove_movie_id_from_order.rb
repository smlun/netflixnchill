class RemoveMovieIdFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :movie_id
  end
end
