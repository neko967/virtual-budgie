class PetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :set_pet, only: %i[destroy]

  def new
    @bird = Bird.find(params[:bird_id])
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to profile_path
    else
      @bird = Bird.find(params[:bird_id])
      render :new
    end
  end

  def destroy
    @pet.destroy!
    redirect_to profile_path
  end

  def speak
    @pet = Pet.find(params[:id])
    @word = @pet.words.order(frequency: :desc).first
    render "pets/show"
  end

  private

  def set_pet
    @pet = current_user.pets.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name).merge(bird_id: params[:bird_id])
  end
end
