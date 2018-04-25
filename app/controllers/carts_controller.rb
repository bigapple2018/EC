class CartsController < ApplicationController
	def comfirm
	end

	def show
		@cart = Cart.find_by(user_id: current_user.id)
	end

	def destroy
        @cart = Item.find(params[:id])
        item.destroy
        redirect_to item_carts_path
    end

	@item_cart.count = params[:note][:point]
end