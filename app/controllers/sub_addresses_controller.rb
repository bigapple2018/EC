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
  	if address.save
  	redirect_to sub_addresses_path
    else
      @address = address
      render "sub_addresses/new"
    end
  end

  def edit
     @address = SubAddress.find(params[:id])
  end

  def update
      address = SubAddress.find(params[:id])
      address.update(subaddress_params)
      redirect_to sub_addresses_path
  end

  def destroy
     address = SubAddress.find(params[:id])
     address.destroy
     redirect_to sub_addresses_path
  end


   private

   def sub_address_params
   	params.require(:sub_address).permit(:sub_postal_code, :sub_address)

   end

end
