class StaticpagesController < ApplicationController
  def top
    @pet_fav_ranks = Pet.find(Favorite.group(:pet_id).order('count(pet_id) desc').limit(3).pluck(:pet_id))
  end
end
