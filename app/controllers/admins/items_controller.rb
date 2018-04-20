class Admins::ItemsController < ApplicationController

def new
	@item = Item.new
end

def create
	item = Item.new(item_params)
	item.save
	redirect_to  admins_items_path
end

def index
	@items = Item.all
end

def show
	@item = Item.find(params[:id])
end

def edit
	@item = Item.find(params[:id])
end

def destroy
	item = Item.find(params[:id])
    item.destroy
    redirect_to admins_items_path
end

private
   def item_params
   	  params.require(:item).permit(:artist, :title_name, :label, :price, :stock, :image)

   	  # params.require(:item).permit(:artist, :title_name, :label, :price, :stock, :image, :admin_id, :genre_id)
   end


end