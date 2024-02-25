class CreateBudgies < ActiveRecord::Migration[7.1]
  def change
    create_table :budgies do |t|
      t.integer :type       , null: false
      t.text :description   , null: false
      t.string :budgie_image

      t.timestamps
    end
  end
end
