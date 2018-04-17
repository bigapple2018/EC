class SubAddressesController < ApplicationController
  def index
     @addresses = SubAddress.all
  end

  def new
  	 @address = SubAddress.new
  end

  def create
  	address = SubAddress.new(sub_address_params)
    address.user_id = current_user.id
  	address.save
  	redirect_to sub_addresses_path
  end

  def edit
  end

   private

   def sub_address_params
   	params.require(:sub_address).permit(:sub_postal_code, :sub_address)

   end

end
