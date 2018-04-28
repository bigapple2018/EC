class CartsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_current_users_cart

	# 購入手続き画面表示
	def check
		@order_history = OrderHistory.new
		#サブ住所の取得
		@subaddresses = SubAddress.where(:user_id => current_user.id)
		#支払い方法の取得
		@payment = Payment.all
		#カート詳細の取得
		@cart = Cart.find_by(:user_id => current_user.id)
		#合計数と合計金額の取得
		@summary_count = @cart.item_carts.sum(:count)
		@summary_price = 0
		@cart.item_carts.each do |item_cart|
				sub_summary = item_cart.item.price * item_cart.count
				@summary_price += sub_summary
		end
	end

	#購入確定
	def confirm
		user = User.find(current_user.id)
		#orderhistoryへのユーザ情報、送付先、支払い方法、合計数、合計金額の登録
		payment = Payment.find(params[:order_history][:payment])
		destination = "#{user.postal_code} #{user.address}"
		if params[:order_history][:destination] != "0"
			subaddress = SubAddress.find(params[:order_history][:destination])
			destination = "#{subaddress.sub_postal_code} #{subaddress.sub_address}"
		end
		summary_count = params[:order_history][:summary][:count]
		summary_price = params[:order_history][:summary][:price]

		orderhistory = OrderHistory.new(
			check_params
		)

		orderhistory.buy_day = Date.today.to_time
		orderhistory.destination = destination
		orderhistory.summary_price = summary_price
		orderhistory.summary_count = summary_count
		orderhistory.user_id = current_user.id
		orderhistory.status_id = 1
		orderhistory.payment_id = payment.id

		if orderhistory.save
			#OrderHistoryが登録できたらOrderHistoryItemを登録する
			cart = Cart.find_by(:user_id => current_user.id)
			cart.item_carts.each do |item_cart|
				orderhistoryitem = OrderHistoryItem.new
				orderhistoryitem.item_id = item_cart.item_id
				orderhistoryitem.order_history_id = orderhistory.id
				orderhistoryitem.price = item_cart.item.price
				orderhistoryitem.artist = item_cart.item.artist
				orderhistoryitem.title_name = item_cart.item.title_name

				if !orderhistoryitem.save
					flash.now[:error] = "購入に失敗しました"
				end
			end

			#CartItemsとCartを削除する
			cart.item_carts.each do |item_cart|
				item_cart.destroy
			end
			cart.destroy
		else
			flash.now[:error] = "購入に失敗しました"
		end
	end

	private
	def check_params
		params.require(:order_history).permit(:destination,
																					:payment_id,
																					:summary_count,
																					:summary_price,
																					:user_id,
																					:status_id,
																					:buy_day
																				)

	end
	def order_history_item_params
		params.require(:order_history_item).permit(:item_id,
			                                         :order_history_id,
																							 :price,
																							 :artist,
																							 :title_name
																						 )

	end

	#ログインユーザのカートが存在しない場合はトップ画面に遷移する
	def check_current_users_cart
		cart = Cart.find_by(:user_id => current_user.id)
		if cart.nil?
			redirect_to root_path
		end
  end
end
