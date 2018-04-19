class CdItem < ApplicationRecord
  belongs_to :item
  has_many :song, ->{order("song_number ASC") }
end
