class Admins::ItemsController < ApplicationController

def new
	@item = Item.new
	@item.cd_items.build
end

def create
	item = Item.new(item_params)
	item.admin_id = 1
	item.save

	# @cd_item = item.cd_items.build
	# @cd_item.save
	# @song = @cd_item.songs.build
	# @song.save

	redirect_to  admins_items_path
end


def index
	@items = Item.page(params[:page]).reverse_order
	# binding.pry
end

def show
	@item = Item.find(params[:id])
end

def edit
	@item = Item.find(params[:id])
	# @cd_item = params[:cd_item]
	@cd_item = @item.cd_items
    # @cd_item.songs.build
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

