class PetInRoomsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @room = Room.find(params[:room_id])
    @pet.enter(@room)
  end
  
  def destroy
    @room = Room.find(params[:room_id])
    @pet = @room.pet_in_rooms.find(params[:id]).pet
    @pet.exit(@room)
  end
end
