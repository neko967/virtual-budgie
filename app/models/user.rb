class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pets, through: :favorites, source: :pet

  validates :name, length: { maximum: 255 }, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  enum role: { general: 0, admin: 1, guest: 2 }

  def own?(object)
    self.id == object.user_id
  end

  def favorite(pet)
    favorite_pets << pet
  end

  def unfavorite(pet)
    favorite_pets.destroy(pet)
  end

  def favorite?(pet)
    favorite_pets.include?(pet)
  end
end
