class Admins::ItemsController < ApplicationController

def new
	@item = Item.new
end

def create
	
	item = Item.new(item_params)
	item.admin_id = 1
	item.save
	redirect_to  admins_items_path
end

def index
	@item = Item.page(params[:page]).reverse_order
end

def show
	@item = Item.find(params[:id])
end

def edit
	@item = Item.find(params[:id])
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
   	  params.require(:item).permit(:artist, :title_name, :label, :price, :stock, :image, :genre_id)
   	  params.require(:songs).permit(:song_title)
   end


end

