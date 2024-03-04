class PetsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]
  before_action :set_pet, only: %i[destroy]

  def index
    @pets = Pet.all
  end

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
      redirect_to pets_path
    else
      render :new
    end
  end

  def destroy
    @pet.destroy!
    redirect_to pets_path
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
