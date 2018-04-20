class Item < ApplicationRecord
  belongs_to :admin

  belongs_to :genre
  attachment :image
  has_many :cd_item
end
