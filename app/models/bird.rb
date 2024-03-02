class Bird < ApplicationRecord
  mount_uploader :bird_image, BirdImageUploader
  has_many :pets, dependent: :destroy

  enum bird_type: { normal: 0, opaline: 1, rainbow: 2 }
end
