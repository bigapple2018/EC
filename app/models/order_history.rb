class OrderHistory < ApplicationRecord
	has_many :order_history_items
	belongs_to :user
	belongs_to :status
	belongs_to :payment
    paginates_per 5

end
