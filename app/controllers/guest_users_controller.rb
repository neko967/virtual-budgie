class GuestUsersController < ApplicationController
  def create
    @user = User.new(name: 'ゲスト',
                     email: Faker::Internet.email,
                     password: 'password',
                     password_confirmation: 'password',
                     role: 2)
    @user.save
    sign_in(@user)
    redirect_to root_path, success: 'ゲストユーザーとしてログインしました。'
  end

  def destroy
    current_user.destroy! if current_user.guest?
    sign_out(current_user)
    redirect_to root_path, success: 'ログアウトしました。'
  end
end
