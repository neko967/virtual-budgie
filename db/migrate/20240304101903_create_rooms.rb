class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name,         null: false
      t.integer :entry_limit, null: false, default: 6
      t.string :room_image

      t.timestamps
    end
  end
end
