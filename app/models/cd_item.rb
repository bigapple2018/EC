class CdItem < ApplicationRecord

	belongs_to :item
	has_many :songs,->{order("song_number ASC") }, dependent: :destroy
	accepts_nested_attributes_for :songs, allow_destroy: true
end
