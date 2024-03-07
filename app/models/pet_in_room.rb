class PetInRoom < ApplicationRecord
  belongs_to :pet
  belongs_to :room

  validates :pet_id, uniqueness: { scope: :room_id }
end
