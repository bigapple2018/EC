class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :song_title
      t.integer :cd_item_id

      t.timestamps
    end
  end
end
