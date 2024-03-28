class CreatePetChatInRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_chat_in_rooms do |t|
      t.string :chat,     null: false
      t.references :room, null: false, foreign_key: true
      t.references :pet,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
