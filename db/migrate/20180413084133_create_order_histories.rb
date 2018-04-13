class CreateOrderHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_histories do |t|

      t.datetime :buy_day,     null: false
      t.string :destination,   null: false
      t.integer :summary_price
      t.integer :summary_count

      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :status, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
