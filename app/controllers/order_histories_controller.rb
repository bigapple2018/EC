class OrderHistoriesController < ApplicationController
  before_action :authenticate_user!
  def index
  	  @histories = current_user.order_histories.order(buy_day: :desc,id: :desc).page(params[:page]).per(5)
  end
end
