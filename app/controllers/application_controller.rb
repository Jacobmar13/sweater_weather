class ApplicationController < ActionController::API
  def validate_session
    if params[:api_key] && ApiKey.find_by(token: params[:api_key])
    else
      render json: ErrorSerializer.unauthorized_json, status: 401
    end
  end
end
