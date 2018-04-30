class Payment < ApplicationRecord
	has_many :order_histories
end
