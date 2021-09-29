require 'rails_helper'

RSpec.describe MapquestService, :vcr do
  it 'returns details on location given' do
    response = MapquestService.get_location('denver,co')

    expect(response).to be_a(Hash)
  end

  it 'gives trip information between two destinations' do
    trip_params = {
      origin: "Denver,CO",
      destination: "New York,NY"
    }
    response = MapquestService.get_travel_time(trip_params)

    expect(response).to be_a(Hash)
  end
end
