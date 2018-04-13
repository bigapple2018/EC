class CreateLeaves < ActiveRecord::Migration[5.1]
  def change
    create_table :leaves do |t|
      t.string :leave_reason, null: false

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
