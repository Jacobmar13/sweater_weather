class Api::V1::UsersController < ApplicationController
  def create
    user = UserApiFacade.create_user_with_key(user_params)
    if user.valid?
      render json: UsersSerializer.new(user)
    else
      render json: ErrorSerializer.error_json(user.errors.full_messages), status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
