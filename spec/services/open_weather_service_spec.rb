require 'rails_helper'

RSpec.describe OpenWeatherService, :vcr do
  it 'returns a weather forecast' do
    lat_lng = ForecastFacade.coordinates('denver,co')
    response = OpenWeatherService.get_weather(lat_lng.lat, lat_lng.lng)
    expect(response).to be_a(Hash)
  end
end
