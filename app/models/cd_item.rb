class CdItem < ApplicationRecord
<<<<<<< HEAD
	belongs_to :item
	has_many :songs, dependent: :destroy
	accepts_nested_attributes_for :songs, allow_destroy: true
=======
  belongs_to :item
  has_many :songs, ->{order("song_number ASC") }
>>>>>>> master
end
