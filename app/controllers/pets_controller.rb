class PetsController < ApplicationController
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

  def edit
    @pet = current_user.pets.find(params[:id])
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name).merge(bird_id: params[:bird_id])
  end
end
