class CreateItemCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :item_carts do |t|
    	
      t.integer :count

      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
