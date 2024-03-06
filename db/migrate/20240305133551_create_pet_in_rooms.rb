class CreatePetInRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_in_rooms do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end

    add_index :pet_in_rooms, [:pet_id, :room_id], unique: true
  end
end
