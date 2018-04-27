class Admins::ItemsController < ApplicationController

def new
	@item = Item.new
	@song = Song.new
end

def create
	
	item = Item.new(item_params)
	item.admin_id = 1
	item.save
	@cd_item = item.cd_items.build
	@cd_item.save
	@song = @cd_item.songs.build(song_params)
	@song.save

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
   	  params.require(:item).permit(:artist, :title_name, :label, :price, :stock, :image, :genre_id, :id, :destroy, :genre_name)
   end

   def song_params
   	  params.require(:song).permit(:song_title)
   end



end

