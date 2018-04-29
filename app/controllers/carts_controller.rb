class CartsController < ApplicationController
	def comfirm
	end

	def show
		@cart = Cart.find_by(user_id: current_user.id)
	end

	def destroy
        item_cart = CartItem.find(params[:id])
	item_cart.destroy
        redirect_to item_carts_id_path
   	end
	
	def current_user
	@item_cart.count = params[:note][:point]
	end
end
