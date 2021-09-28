require 'rails_helper'

describe 'forecasts' do
  describe 'get request' do
    it 'can return weather forecast for a given location' do
      location = "denver,co"

      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      books = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(books[:id]).to eq(nil)
      expect(books[:type]).to eq("forecast")
    end
  end
end
