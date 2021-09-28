class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  attributes :api_key do |object|
    object.api_keys.map(&:token).first
  end
end
