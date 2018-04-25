class OrderHistoriesController < ApplicationController
  def index
  	  @histories = current_user.order_histories.order(buy_day: :desc).page(params[:page]).per(5)
  end
end
