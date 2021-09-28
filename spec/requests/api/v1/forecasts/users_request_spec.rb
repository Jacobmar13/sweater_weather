require 'rails_helper'

describe 'users' do
  describe 'post request' do
    it 'can create a user and return a json response' do
      user_params = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful

      user = JSON.parse(response.body, symbolize_names: true)[:data]
      user_object = User.last

      expect(user).to have_key(:type)
      expect(user[:type]).to eq("users")

      expect(user).to have_key(:id)
      expect(user[:id].to_i).to eq(user_object.id)

      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to eq(user_object.email)

      expect(user[:attributes]).to have_key(:api_key)
      expect(user[:attributes][:api_key]).to eq(user_object.api_keys.map(&:token).first)

      expect(user[:attributes]).to_not have_key(:password)
      expect(user[:attributes]).to_not have_key(:password_digest)
    end
    it 'gives an error message if password and confirmation do not match' do
      user_params = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password1234"
      }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to have_key(:status)
      expect(error[:errors][:status]).to eq("Not Valid")
      expect(error[:errors]).to have_key(:message)
      expect(error[:errors]).to have_key(:code)
      expect(error[:errors][:code]).to eq(400)
    end

    it 'gives an error message if user already exists' do
      User.create(email: "whatever@example.com", password: "password")

      user_params = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password1234"
      }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to have_key(:status)
      expect(error[:errors][:status]).to eq("Not Valid")
      expect(error[:errors]).to have_key(:message)
      expect(error[:errors]).to have_key(:code)
      expect(error[:errors][:code]).to eq(400)
    end
  end
end
