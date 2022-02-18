class AddUsersToTimeTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :time_tracks, :user_id, :bigint
    add_foreign_key :time_tracks, :users
    add_column :users, :name, :string
  end
end
