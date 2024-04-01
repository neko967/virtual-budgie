class PetsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_pet, only: %i[destroy]

  def show
    @pet = Pet.find(params[:id])
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to mypage_path, success: '新しいペットをお迎えしました！'
    else
      redirect_to birds_path, danger: 'ペットをお迎えに失敗しました。'
    end
  end

  def destroy
    @pet.destroy!
    redirect_to mypage_path, success: 'ペットとお別れしました。'
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
    params.permit(:name).merge(bird_id: params[:bird_id])
  end
end
