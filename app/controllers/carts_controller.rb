class CartsController < ApplicationController
	def comfirm
	end

	def show
		@cart = Cart.find_by(user_id: current_user.id)
		@total_price = 0
		@total_count = 0
		@cart.item_carts.each do |itemcart|
		@price = itemcart.item.price * itemcart.count
		@total_price += @price
        # @total_price += itemcart.item.price
        @total_count += itemcart.count
		end
	end

<<<<<<< HEAD


end
=======
	def destroy
        item_cart = CartItem.find(params[:id])
	item_cart.destroy
        redirect_to item_carts_id_path
   	end
	
	def current_user
	@item_cart.count = params[:note][:point]
	end
end
>>>>>>> df02165c1dec9b6d0a38b8962ad28f49b9ddc2f8
