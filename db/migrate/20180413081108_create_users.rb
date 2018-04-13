class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_kana,        null: false
      t.string :first_kana,       null: false
      t.string :postal_code,      null: false
      t.string :address,          null: false
      t.string :tell,             null: false
      t.string :mail_address,     null: false
      t.string :encrypt_password, null: false
      t.datetime :delete_date
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
