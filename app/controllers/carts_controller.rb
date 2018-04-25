class CartsController < ApplicationController
	def comfirm
	end

	def show
		@cart = Cart.find_by(user_id: current_user.id)
	end

	@note.point = params[:note][:point]

end 