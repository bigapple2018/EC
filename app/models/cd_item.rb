class CdItem < ApplicationRecord
  belongs_to :item
  has_many :songs, ->{order("song_number ASC") }
end
