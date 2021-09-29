require 'rails_helper'

describe 'forecasts', :vcr do
  describe 'get request' do
    it 'can return weather forecast for a given location' do
      location = "denver,co"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      books = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(books).to have_key(:id)
      expect(books[:id]).to eq(nil)

      expect(books).to have_key(:type)
      expect(books[:type]).to eq("forecast")

      expect(books).to have_key(:attributes)
      expect(books[:attributes]).to have_key(:current_weather)
      expect(books[:attributes][:current_weather]).to have_key(:datetime)
      expect(books[:attributes][:current_weather]).to have_key(:sunrise)
      expect(books[:attributes][:current_weather]).to have_key(:sunset)
      expect(books[:attributes][:current_weather]).to have_key(:temperature)
      expect(books[:attributes][:current_weather]).to have_key(:feels_like)
      expect(books[:attributes][:current_weather]).to have_key(:humidity)
      expect(books[:attributes][:current_weather]).to have_key(:uvi)
      expect(books[:attributes][:current_weather]).to have_key(:visibility)
      expect(books[:attributes][:current_weather]).to have_key(:conditions)
      expect(books[:attributes][:current_weather]).to have_key(:icon)

      expect(books[:attributes]).to have_key(:daily_weather)
      expect(books[:attributes][:daily_weather].count).to eq(5)
      books[:attributes][:daily_weather].each do |day|
        expect(day).to have_key(:date)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)
        expect(day).to_not have_key(:temperature)
        expect(day).to_not have_key(:feels_like)
        expect(day).to_not have_key(:humidity)
        expect(day).to_not have_key(:uvi)
        expect(day).to_not have_key(:visibility)
      end

      expect(books[:attributes]).to have_key(:hourly_weather)
      expect(books[:attributes][:hourly_weather].count).to eq(8)
      books[:attributes][:hourly_weather].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour).to have_key(:temperature)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)
        expect(hour).to_not have_key(:datetime)
        expect(hour).to_not have_key(:sunrise)
        expect(hour).to_not have_key(:sunset)
        expect(hour).to_not have_key(:feels_like)
        expect(hour).to_not have_key(:humidity)
        expect(hour).to_not have_key(:uvi)
        expect(hour).to_not have_key(:visibility)
      end
    end
  end
end
