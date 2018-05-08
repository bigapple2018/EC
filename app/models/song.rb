class Song < ApplicationRecord
  belongs_to :cd_item

  NUM_REGEXP = /\A[0-9]+\z/
  validates :song_title, presence: true
  validates :song_number, presence: true
  validates :song_number, format: { with: NUM_REGEXP, message: "数字のみが使用できます" },if:"song_number.present?"

end
