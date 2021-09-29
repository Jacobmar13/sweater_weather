class UserApiFacade
  class << self
    def create_user_with_key(user_params)
      user = User.create(user_params)
      user.api_keys.create(token: SecureRandom.hex) if user.valid?
      user
    end

    def authenticate(sessions_params)
      user = User.find_by(email: sessions_params[:email])
      user if user&.authenticate(sessions_params[:password])
    end
  end
end
