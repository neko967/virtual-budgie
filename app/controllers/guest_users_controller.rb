class GuestUsersController < ApplicationController
  def create
      @user = User.new(name: 'ゲスト',
                       email: Faker::Internet.email,
                       password: 'password',
                       password_confirmation: 'password')
      @user.save
      sign_in(@user)
      redirect_to root_path
    end
end
