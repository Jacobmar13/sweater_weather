require 'rails_helper'

describe 'books' do
  describe 'get request' do
    it 'can return books for a given location and quantity' do
      location = "denver,co"
      quantity = 5

      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response).to be_successful
      books = JSON.parse(response.body, symbolize_names: true)[:data]
    end
  end
end
