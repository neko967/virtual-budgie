class PetInRoomsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @room = Room.find(params[:room_id])
    @pets_in_room = PetInRoom.where(room_id: @room.id)
    @place = [1, 2, 3, 4, 5, 6].difference(@pets_in_room.map { |pet_in_room| pet_in_room.place }).first
    @pet.enter(@room, @place)

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
