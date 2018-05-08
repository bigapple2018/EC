class CdItem < ApplicationRecord
	belongs_to :item
	has_many :songs,->{order("song_number ASC") }, dependent: :destroy
	accepts_nested_attributes_for :songs, allow_destroy: true

	validates :cd_title, presence: true


	# def hasSongs
	# 	# Itemの新規登録時にCD_ITEMを遡ってsongまで存在確認をしてしまうため、利用できない
	# 	if songs.count < 1
  #   	errors.add(:cd_item,"収録曲は１曲以上登録してください")
	# 	end
  # end
end
