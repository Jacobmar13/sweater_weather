require 'rails_helper'

describe 'backgrounds', :vcr do
  describe 'get request' do
    it 'can return a background image for a given location' do
      location = "denver,co"

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      books = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(books[:id]).to eq(nil)
      expect(books[:type]).to eq("image")
    end
  end
end
