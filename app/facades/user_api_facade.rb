class UserApiFacade
  class << self
    def create_user_with_key(user_params)
      user = User.create(user_params)
      user.api_keys.create(token: SecureRandom.hex) if user.valid?
      user
    end
  end
end
