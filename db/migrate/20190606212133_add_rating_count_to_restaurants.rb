class AddRatingCountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :ratings_count, :integer
  end
end
