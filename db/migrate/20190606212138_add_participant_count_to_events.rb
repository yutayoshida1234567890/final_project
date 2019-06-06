class AddParticipantCountToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :participants_count, :integer
  end
end
