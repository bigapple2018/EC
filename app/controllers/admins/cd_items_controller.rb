class Admins::CdItemsController < ApplicationController
  def new
  	@item = Item.find_by(params[:item_id])
  	@cd_item = CdItem.new
  end

  def show
    @cd_item = CdItem.find(params[:id])
    @cd_item.songs.build
  end

  def create
  	@cd_item = CdItem.new(item_id: params[:item_id])
  	@cd_item.save
  end

  def destroy
  end

  private

  def songs_params
   	  params.require(:cd_items).permit(
        :cd_title,
        :cd_item_id)
  end
end
