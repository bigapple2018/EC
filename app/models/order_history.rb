class OrderHistory < ApplicationRecord
	blongs_to :user
	blongs_to :status
	blongs_to :order_history_item
	blongs_to :payment
end
