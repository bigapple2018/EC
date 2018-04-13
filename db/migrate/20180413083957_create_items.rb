class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :artist,    null: false
      t.string :title_name,null: false
      t.string :label,     null: false
      t.integer :price,    null: false
      t.integer :stock,    null: false
      t.text :image_id,    null: false

      t.references :admin, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
      t.references :user, foreign_key: true
  end
 end
end
