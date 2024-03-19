class PetInRoomsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @room = Room.find(params[:room_id])
    @pet.enter(@room)

    respond_to do |format|
      format.turbo_stream
    end
  end
  
  def destroy
    @room = Room.find(params[:room_id])
    @pet = @room.pet_in_rooms.find(params[:id]).pet
    @pet.exit(@room)

    respond_to do |format|
      format.turbo_stream
    end
  end
end
