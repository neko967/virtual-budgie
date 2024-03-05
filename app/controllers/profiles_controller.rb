class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update]
  before_action :set_user, only: %i[edit update]

  def show
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def favorites
    @favorite_pets = current_user.favorite_pets.includes(:user).order(created: :desc)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def profile_params
    params.require(:user).permit(:name, :email)
  end
end
