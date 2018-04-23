class ItemsCartController < ApplicationController
  before_action :sign_in_required

  #カートに追加する
  def create
    # ユーザのカートがなければ作成する
    cart = Cart.find_by(user_id:current_user.id)
    if cart.empty?
      cart = Cart.new(:user_id => current_user.id)
      if !cart.save
        redirect_to item_path(params[:id])
      end
    end
    items_cart = ItemsCart.new(
      :cart_id => cart.id
      :items_id => params[:id]
      :count => 1
    )
    if items_cart.save
      redirect_to item_path(prams[:id]) #TODO:カート詳細画面への修正が必要
    else
      redirect_to item_path(params[:id])
    end
  end

  #カートの中身を更新する
  def update
  end

  def destroy
  end

end
