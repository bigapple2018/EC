class ItemsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
  def index
    item_search_init
    @genres = Genre.all
    @slick_images = Item.limit(8).order("created_at DESC")
  end

  def show
    item_search_init
    @item = Item.find(params[:id])
  end

  private
  def item_search_init
    @q = Item.search(params[:q])
    @items = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end
end
