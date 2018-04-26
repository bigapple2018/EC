class Admins::OrderHistoryController < ApplicationController

	def index
		@histories = OrderHistory.where(user_id: params[:user_id]).page(params[:page]).per(5)
		@user = User.find(params[:user_id])
	end
end
