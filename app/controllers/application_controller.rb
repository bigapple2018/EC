class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 helper_method :current_cart
 helper_method :current_cart_inside

	def current_cart
		if session[:cart_id]
			@cart = Cart.find(session[:cart_id])
		elsif Cart.find_by(:user_id => current_user.id)
      @cart = Cart.find_by(:user_id => current_user.id)
      session[:cart_id] = @cart.id
    else
			@cart = Cart.create(
        :user_id => current_user.id
      )
			session[:cart_id] = @cart.id
		end
	end

  def current_item_count
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
      count = cart.item_carts.count
    elsif Cart.find_by(:user_id => current_user)
      cart = Cart.find_by(:user_id => current_user)
      count = cart.item_carts.count
    else
      count = 0
    end
      count
  end

end
