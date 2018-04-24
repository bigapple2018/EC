class AddIteminfoToOrderHistoryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_history_items, :price, :integer
    change_column :order_history_items, :price, :integer, :null => false
    add_column :order_history_items, :artist, :string
    change_column :order_history_items, :artist, :string, :null => false
    add_column :order_history_items, :title_name, :string
    change_column :order_history_items, :title_name, :string, :null => false
  end
end
