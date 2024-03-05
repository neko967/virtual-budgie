class FavoritesController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    current_user.favorite(@pet)
  end
  
  def destroy
    @pet = current_user.favorites.find(params[:id]).pet
    current_user.unfavorite(@pet)
  end
end
