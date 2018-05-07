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

  def edit
    @cd_item = CdItem.find(params[:id])
    if @cd_item.songs.count == 0
      @cd_item.songs.build
    end
  end

  def update
    cd_item = CdItem.find(params[:id])
    cd_item.update(cd_items_params)
  	redirect_to admins_items_path
  end

  def destroy
  end

  private

  def cd_items_params
   	  params.require(:cd_item).permit( :cd_title,
                                        :cd_item_id,
                                        songs_attributes: [:id, :cd_item_id, :song_title, :song_number, :_destroy])
  end
end
