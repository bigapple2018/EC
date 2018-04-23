class AddSongNumberToSong < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :song_number, :integer
    change_column :songs, :song_number, :integer, :null => false
  end
end
