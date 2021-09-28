require 'rails_helper'

RSpec.describe MapquestService do
  it 'returns a list latitude and longitude' do
    response = MapquestService.get_location('denver,co')
    expect(response).to be_a(Hash)
  end
end
