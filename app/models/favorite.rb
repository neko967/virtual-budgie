class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validate :user_id, uniquness: { scope: :pet_id }
end
