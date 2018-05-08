class Item < ApplicationRecord
  has_many :item_carts
  has_many :cd_items, dependent: :destroy
  belongs_to :genre
  attachment :image
  accepts_nested_attributes_for :cd_items, allow_destroy: true

  NUM_REGEXP = /\A[0-9]+\z/
  validates :artist, presence: true
  validates :title_name, presence: true
  validates :label, presence: true
  validates :price, presence: true
  validates :price, format: { with: NUM_REGEXP, message: "数字のみが使用できます" },if:"price.present?"
  validates :stock, presence: true
  validates :stock, format: { with: NUM_REGEXP, message: "数字のみが使用できます" },if:"stock.present?"
  validates :image, presence: true
  validate  :hasCds

	def hasCds
		if cd_items.size < 1
    	errors.add(:item,"CDタイトルは一つ以上登録してください")
		end
  end
end
