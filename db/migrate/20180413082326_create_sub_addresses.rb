class CreateSubAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_addresses do |t|
      t.string :sub_postal_code, null: false
      t.string :sub_address,     null: false

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
