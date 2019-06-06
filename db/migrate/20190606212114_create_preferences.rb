class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.string :cuisine
      t.string :preference_scale
      t.string :dietary_restriction

      t.timestamps
    end
  end
end
