require 'rails_helper'

describe 'road_trip' do
  describe 'post request', :vcr do
    before :each do
      user_params = {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      @headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/users", headers: @headers, params: JSON.generate(user_params)

      sessions_params = {
        email: "whatever@example.com",
        password: "password"
      }
      post "/api/v1/sessions", headers: @headers, params: JSON.generate(sessions_params)
      session = JSON.parse(response.body, symbolize_names: true)[:data]
      @api_key = session[:attributes][:api_key]
    end

    describe 'happy path' do
      it 'can return trip time and destination forecast with valid params' do
        trip_params = {
          origin: "Denver,CO",
          destination: "Pueblo,CO",
          api_key: @api_key
        }

        post "/api/v1/road_trip", headers: @headers, params: JSON.generate(trip_params)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        trip = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(trip).to have_key(:id)
        expect(trip[:id]).to eq(nil)

        expect(trip).to have_key(:type)
        expect(trip[:type]).to eq("roadtrip")

        expect(trip).to have_key(:attributes)
        expect(trip[:attributes]).to have_key(:start_city)
        expect(trip[:attributes][:start_city]).to eq(trip_params[:origin])

        expect(trip[:attributes]).to have_key(:end_city)
        expect(trip[:attributes][:end_city]).to eq(trip_params[:destination])

        expect(trip[:attributes]).to have_key(:travel_time)

        expect(trip[:attributes]).to have_key(:weather_at_eta)
        expect(trip[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(trip[:attributes][:weather_at_eta]).to have_key(:conditions)
      end
    end

    describe 'sad path/edge cases' do
      it 'is unauthorized and give an error message if api_key is missing' do
        trip_params = {
          origin: "Denver,CO",
          destination: "Pueblo,CO"
        }

        post "/api/v1/road_trip", headers: @headers, params: JSON.generate(trip_params)

        expect(response.status).to eq(401)

        error = JSON.parse(response.body, symbolize_names: true)

        expect(error).to have_key(:errors)
        expect(error[:errors]).to have_key(:status)
        expect(error[:errors][:status]).to eq("Not Authorized")
        expect(error[:errors]).to have_key(:message)
        expect(error[:errors][:message]).to eq("Api Key is not valid/missing")
        expect(error[:errors]).to have_key(:code)
        expect(error[:errors][:code]).to eq(401)
      end

      it 'is unauthorized and gives an error message if api_key is wrong' do
        trip_params = {
          origin: "Denver,CO",
          destination: "Pueblo,CO",
          api_key: "12345678"
        }

        post "/api/v1/road_trip", headers: @headers, params: JSON.generate(trip_params)

        expect(response.status).to eq(401)

        error = JSON.parse(response.body, symbolize_names: true)

        expect(error).to have_key(:errors)
        expect(error[:errors]).to have_key(:status)
        expect(error[:errors][:status]).to eq("Not Authorized")
        expect(error[:errors]).to have_key(:message)
        expect(error[:errors][:message]).to eq("Api Key is not valid/missing")
        expect(error[:errors]).to have_key(:code)
        expect(error[:errors][:code]).to eq(401)
      end

      it 'gives impossible response if destination has no route from origin' do
        trip_params = {
          origin: "Denver,CO",
          destination: "London,UK",
          api_key: @api_key
        }

        post "/api/v1/road_trip", headers: @headers, params: JSON.generate(trip_params)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        trip = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(trip).to have_key(:id)
        expect(trip[:id]).to eq(nil)

        expect(trip).to have_key(:type)
        expect(trip[:type]).to eq("roadtrip")

        expect(trip).to have_key(:attributes)
        expect(trip[:attributes]).to have_key(:start_city)
        expect(trip[:attributes][:start_city]).to eq(trip_params[:origin])

        expect(trip[:attributes]).to have_key(:end_city)
        expect(trip[:attributes][:end_city]).to eq(trip_params[:destination])

        expect(trip[:attributes]).to have_key(:travel_time)
        expect(trip[:attributes][:travel_time]).to eq("Impossible")

        expect(trip[:attributes]).to have_key(:weather_at_eta)
        expect(trip[:attributes][:weather_at_eta]).to eq({})
      end
    end
  end
end
