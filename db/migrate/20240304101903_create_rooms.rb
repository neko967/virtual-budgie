class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :nama, null: false
      t.integer :entry_limit, default: 6, null: false

      t.timestamps
    end
  end
end
