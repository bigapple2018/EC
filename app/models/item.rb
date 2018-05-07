class Item < ApplicationRecord
  has_many :item_carts
  has_many :cd_items, dependent: :destroy
  belongs_to :genre
  attachment :image
  accepts_nested_attributes_for :cd_items, allow_destroy: true # この行を追記
end
