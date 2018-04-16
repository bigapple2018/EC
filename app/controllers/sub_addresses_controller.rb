class SubAddressesController < ApplicationController
  def index
  end

  def new
  	 @address = SubAddress.new
  end

  def create
  	user = SubAddress(subAddress_params)
  	user.save
  	redirect_to "/sub_address"
  end

  def edit
  end

   private

   def subAddress_params
   	params.require(:subAddress).permit(:sub_postel_code, :sub_address)

   end

end
