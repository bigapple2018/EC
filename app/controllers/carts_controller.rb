class CartsController < ApplicationController
	def comfirm
	end

	def show
		@cart = Cart.find_by(user_id: current_user.id)
		@total_price = 0
		@total_count = 0
		@cart.item_carts.each do |itemcart|
		binding.pry
        @total_price += itemcart.item.price
        @total_count += itemcart.item.count
		end
	end



end