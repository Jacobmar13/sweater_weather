require 'rails_helper'

RSpec.describe UnsplashService, :vcr do
  it 'returns an image with query' do
    response = UnsplashService.get_image('denver,co')
    expect(response).to be_a(Hash)
  end
end
