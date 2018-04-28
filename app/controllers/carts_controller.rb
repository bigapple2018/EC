class CartsController < ApplicationController


	# 購入手続き画面表示
	def check
		#ユーザ情報の取得
		@user = User.find(current_user.id)
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
		#orderhistoryへのユーザ情報、送付先、支払い方法、合計数、合計金額の登録
		payment = Payment.find(params[:payment])
		destination = "#{user.postal_code} #{user.address}"
		if params[:distination] != "0"
			subaddress = SubAddress.find(params[:distination])
			destination = "#{subaddress.sub_postal_code} #{subaddress.sub_address}"
		end
		summary_count = params[:summary][:count]
		summary_price = params[:summary][:price]

		orderhistory = OrderHistory.new(
			:buy_day => Date.today.to_time,
			:destination => destination,
			:summary_price => summary_price,
			:summary_count => summary_count,
			:user_id => current_user.id,
			:status_id => 0,
			:payment_id => payment.id,
		)
		if orderhistory.save
			#OrderHistoryが登録できたらOrderHistoryItemを登録する
			cart = Cart.find_by(:user_id => current_user.id)
			cart.item_carts.each do |item_cart|
				item = Item.find(item_cart.item_id)
				orderhistoryitem = OrderHistoryItem.new(
					:item_id => item_cart.item_id,
					:order_history_id => orderhistory.id,
					:price => item.price,
					:artist => item.artist,
					:title_name => item.title_name
				)
				orderhistoryitem.save
			end

			#CartItemsとCartを削除する
			cart.item_carts.each do |item_cart|
				item_cart.destroy
			end
			cart.destroy
		end
	end

	private
	def check_params
		params.require(:cart).permit(:distination, :payment,:summary_count,:summary_price)
	end
end
