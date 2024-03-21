class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @pet_chats_in_room = PetChatInRoom.where(room_id: params[:id])
    @pets_in_room = PetInRoom.where(room_id: params[:id])
  end
end
