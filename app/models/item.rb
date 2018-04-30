class Item < ApplicationRecord
  # belongs_to :admin
  has_many :item_carts
  belongs_to :genre
  attachment :image

  has_many :cd_items, dependent: :destroy
  accepts_nested_attributes_for :cd_items, allow_destroy: true # この行を追記
end
