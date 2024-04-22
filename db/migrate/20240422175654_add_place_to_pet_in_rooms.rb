class AddPlaceToPetInRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :pet_in_rooms, :place, :integer, null: false
  end
end
