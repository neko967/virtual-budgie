class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :bird
  has_many :words, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, length: { maximum: 255 }, presence: true
end
