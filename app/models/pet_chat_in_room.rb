class PetChatInRoom < ApplicationRecord
  belongs_to :room
  belongs_to :pet
end
