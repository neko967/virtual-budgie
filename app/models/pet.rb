class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :bird
  has_many :words, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :pet_in_rooms, dependent: :destroy
  
  validates :name, length: { maximum: 255 }, presence: true

  def enter(room)
    pet_in_rooms.create(room_id: room.id)
  end

  def exit(room)
    pet_in_rooms.find_by(room_id: room.id, pet_id: self.id).destroy
  end

  def enter?(room)
    pet_in_rooms.exists?(room_id: room.id)
  end
end
