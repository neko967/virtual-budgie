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
      redirect_to mypage_path
    else
      @bird = Bird.find(params[:bird_id])
      render :new
    end
  end

  def destroy
    @pet.destroy!
    redirect_to mypage_path
  end

  def speak
    pet = Pet.find(params[:id])
    vocabs = pet.vocabs.order(frequency: :desc).limit(10)
    render json: { vocabs: vocabs.map(&:word) }
  end

  private

  def set_pet
    @pet = current_user.pets.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name).merge(bird_id: params[:bird_id])
  end
end
