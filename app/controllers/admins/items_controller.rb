class Admins::ItemsController < ApplicationController

def new
	@item = Item.new
	@item.cd_items.build
end

def create
	item = Item.new(item_params)
	item.admin_id = 1
	genre = Genre.find(item_params[:genre_id])
	item.genre_name = genre.genre_name
	item.save
	redirect_to  admins_items_path
end


def index
	@items = Item.page(params[:page]).reverse_order
end

def show
	@item = Item.find(params[:id])
end

def edit
	@item = Item.find(params[:id])
	@cd_item = @item.cd_items
end

def update
	item = Item.find(params[:id])
	item.update(item_params)
	redirect_to admins_items_path
end

def destroy
	item = Item.find(params[:id])
	item.destroy
	redirect_to admins_items_path
end

private
   def item_params
   	  params.require(:item).permit(:artist,
   	                               :title_name,
   	                               :label,
   	                               :price,
   	                               :stock,
   	                               :image,
   	                               :genre_id,
   	                               :_destroy,
   	                               :genre_name,
   	                               cd_items_attributes: [:id, :item_id, :cd_title, :_destroy])
   end
end

