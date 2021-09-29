require 'rails_helper'

describe 'sessions' do
  describe 'post request' do
    before :each do
      user_params = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }

      headers = { "CONTENT_TYPE" => "application/json" }

      post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    end

    it 'can authenticate a user and return an api key' do
      sessions_params = {
        email: "whatever@example.com",
        password: "password"
      }

      post "/api/v1/sessions", headers: headers, params: JSON.generate(sessions_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:type)

      expect(user).to have_key(:id)

      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to have_key(:email)

      expect(user[:attributes]).to have_key(:api_key)

      expect(user[:attributes]).to_not have_key(:password)
      expect(user[:attributes]).to_not have_key(:password_digest)
    end

    it 'gives an error message if email does not exist' do
      sessions_params = {
        email: "whomever@example.com",
        password: "password"
      }

      post "/api/v1/sessions", headers: headers, params: JSON.generate(sessions_params)

      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:errors)
      expect(error[:errors]).to have_key(:status)
      expect(error[:errors][:status]).to eq("Not Valid")
      expect(error[:errors]).to have_key(:message)
      expect(error[:errors]).to have_key(:code)
      expect(error[:errors][:code]).to eq(400)
    end

    it 'gives an error message if email does not exist' do
      sessions_params = {
        email: "whatever@example.com",
        password: "password1234"
      }

      post "/api/v1/sessions", headers: headers, params: JSON.generate(sessions_params)

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
