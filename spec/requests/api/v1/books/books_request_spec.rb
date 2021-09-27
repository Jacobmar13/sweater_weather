require 'rails_helper'

describe 'books' do
  describe 'get request' do
    it 'can return books for a given location and quantity' do
      location = "denver,co"
      quantity = 5

      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response).to be_successful
      books = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(books[:id]).to eq(nil)
      expect(books[:type]).to eq("books")

      expect(books[:attributes]).to have_key(:destination)
      expect(books[:attributes][:destination]).to eq(location)

      expect(books[:attributes]).to have_key(:forecast)
      expect(books[:attributes][:forecast]).to have_key(:summary)
      expect(books[:attributes][:forecast]).to have_key(:temperature)

      expect(books[:attributes]).to have_key(:total_books_found)

      expect(books[:attributes]).to have_key(:books)
      expect(books[:attributes][:books].count).to eq(quantity)

      books[:attributes][:books].each do |book|
        expect(book).to have_key(:isbn)
        expect(book).to have_key(:title)
        expect(book).to have_key(:publisher)
      end
    end
  end
end
