class Item < ApplicationRecord
  # belongs_to :admin
  has_many :item_carts
  belongs_to :genre
  attachment :image

  has_many :cd_items
  has_many :item_carts
end
