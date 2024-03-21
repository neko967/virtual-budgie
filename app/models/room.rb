class Room < ApplicationRecord
    mount_uploader :room_image, RoomImageUploader
    
    has_many :pet_in_rooms, dependent: :destroy
    has_many :pet_chat_in_rooms, dependent: :destroy
end
