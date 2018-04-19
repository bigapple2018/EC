class Admins::OrderHistoryController < ApplicationController

	def index
		@order_histories = OrderHistories.all
	end

end
