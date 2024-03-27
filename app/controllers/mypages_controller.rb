class MypagesController < ApplicationController
  def show
    @my_pets = current_user.pets
    @favorite_pets = current_user.favorite_pets.includes(:user).order(created_at: :desc)
  end

  def show_my_pet
    @pet = current_user.pets.find(params[:id])
  end

  def show_fav_pet
    @pet = current_user.favorite_pets.find(params[:id])
  end
end
