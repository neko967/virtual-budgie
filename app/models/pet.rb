class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :bird

  validates :name, length: { maximum: 255 }, presence: true
end
