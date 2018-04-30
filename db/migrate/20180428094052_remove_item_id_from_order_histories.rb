class RemoveItemIdFromOrderHistories < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_histories, :item_id, :integer
  end
end
