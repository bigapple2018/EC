class Admins::CdItemsController < ApplicationController
  def new
  	@item = Item.find_by(params[:item_id])
  	@cd_item = CdItem.new
  end

  def show
    @cd_item = CdItem.find(params[:id])
    @song = Song.new
  end

  def create
  	@cd_item = CdItem.new(item_id: params[:item_id])
  	@cd_item.save
  end

  def destroy
  end

  private

  def song_params
   	  params.require(:songs).permit(:song_title,song_attributes: [:id,:_destroy])

  end
end
