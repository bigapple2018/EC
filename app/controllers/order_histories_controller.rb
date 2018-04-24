class OrderHistoriesController < ApplicationController
  def index
  	  @histories = OrderHistory.all.includes(:order_history_items)
  	  @status = Status.all
  end
end
