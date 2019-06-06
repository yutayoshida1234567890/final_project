class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :rating_scale
      t.string :occasion

      t.timestamps
    end
  end
end
