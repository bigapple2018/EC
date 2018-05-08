class Admins::OrderHistoryController < ApplicationController
	before_action :authenticate_admin!
	def index
		@histories = OrderHistory.where(user_id: params[:user_id]).page(params[:page]).per(5)
		@user = User.find(params[:user_id])
	end
end
