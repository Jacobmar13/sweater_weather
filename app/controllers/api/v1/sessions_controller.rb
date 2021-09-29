class Api::V1::SessionsController < ApplicationController
  def create
    user = UserApiFacade.authenticate(sessions_params)
    if !user.nil?
      render json: UsersSerializer.new(user)
    else
      render json: ErrorSerializer.credentials_json, status: 400
    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
