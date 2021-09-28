class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:password] == params[:password_confirmation]
      user = User.create!(user_params)
      user.api_keys.create!(token: SecureRandom.hex)
      render json: UsersSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
