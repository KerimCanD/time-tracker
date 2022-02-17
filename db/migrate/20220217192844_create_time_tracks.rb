class CreateTimeTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :time_tracks do |t|
      t.text :description
      t.string :time_type
      t.datetime :time_started
      t.datetime :time_ended

      t.timestamps
    end
  end
end
