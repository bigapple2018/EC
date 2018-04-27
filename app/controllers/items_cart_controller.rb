class ItemsCartController < ApplicationController
  #カートに追加する
  def create
    # ユーザのカートがなければ作成する
    cart = Cart.find_or_create_by(user_id:current_user.id)
    item_id = params[:item_id]
    # 同じ商品がすでにカートに追加されているかを判定する
    items_cart = ItemCart.find_by(cart_id:cart.id,item_id:item_id)
    if items_cart.nil?
      items_cart = ItemCart.new(
        :cart_id => cart.id,
        :item_id => item_id,
        :count => 1
      )
      if items_cart.save
        # 在庫を減らす
        items_stock_update(item_id,1,true)
        #TODO:カート詳細へのリダイレクトに修正すること
        redirect_to item_path(item_id)
      else
        redirect_to item_path(item_id)
      end
    else
      # すでに同じ商品がカートに追加されている場合はcountのみ更新する
      latest_count = items_cart.count + 1
      if  items_cart.update(count: latest_count)
        # 在庫を減らす
        items_stock_update(item_id,1,true)
        #TODO:カート詳細へのリダイレクトに修正すること
        redirect_to item_path(item_id)
      else
        redirect_to item_path(item_id)
      end
    end
  end

  #カートの中身を更新する
  def update
    @item_cart = ItemCart.find(params[:id])
    @items_cart.update
    redirect_to cart_path(current_user)

  end
  #カートから商品を削除する
  def destroy
    @item_cart = ItemCart.find(params[:id])
    @item_cart.destroy
    redirect_to cart_path(current_user)
  end

  private
  #商品の在庫を更新する
  #item_id:対象の商品のid / count:増減させる個数 / isDecrease:true⇒減らす、false⇒増やす
  def items_stock_update(item_id,count,isDecrease)
    item = Item.find(item_id)
    if isDecrease
      latest_stock = item.stock - count
    else
      latest_stock = item.stock + count
    end
    item.update(stock: latest_stock)
  end
end
