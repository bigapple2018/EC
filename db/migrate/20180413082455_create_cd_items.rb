class CreateCdItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cd_items do |t|
    	
      t.string :cd_title

      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
