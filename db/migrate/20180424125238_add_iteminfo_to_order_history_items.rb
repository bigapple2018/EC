class AddIteminfoToOrderHistoryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_history_items, :price, :integer, :null => false, :default => 0
    add_column :order_history_items, :artist, :string, :null => false, :default => ""
    add_column :order_history_items, :title_name, :string, :null => false, :default => ""
  end
end