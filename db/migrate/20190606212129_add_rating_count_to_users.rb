class AddRatingCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ratings_count, :integer
  end
end
