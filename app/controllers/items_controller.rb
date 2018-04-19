class ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @q = Item.search(params[:q])
    @items = @q.result(distinct: true)
  end

  def search_params
    params.require(:q).permit(:title_name_cont)
  end
end
