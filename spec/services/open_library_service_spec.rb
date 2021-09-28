require 'rails_helper'

RSpec.describe OpenLibraryService do
  it 'returns a list of books' do
    response = OpenLibraryService.get_books('denver,co')
    expect(response).to be_a(Hash)
  end
end
