class Admins::CdController < ApplicationController
	def index
		
	end


private
   def item_params
   	  params.require(:item).permit(:artist, :title_name, :label, :price, :stock, :image, :genre_id, :id, :destroy)
   	  params.require(:song).permit(:song_title)
   end
end