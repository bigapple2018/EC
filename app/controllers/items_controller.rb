class ItemsController < ApplicationController
  def index
    item_search_init
    @genres = Genre.all
  end

  def show
    item_search_init
    @item = Item.find(params[:id])
  end

  private
  def item_search_init
    @q = Item.search(params[:q])
    @items = @q.result(distinct: true)
  end
  def search_params
    params.require(:q).permit(:title_name_cont)
  end
end
