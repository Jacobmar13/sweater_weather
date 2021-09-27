class ForecastFacade
  class << self
    def coordinates(address)
      location = MapquestService.get_location(address)[:results][0][:locations][0][:latLng]
      LatLng.new(location)
    end

    def retrieve_weather(address)
      lat_lng = coordinates(address)
      weather = OpenWeatherService.get_weather(lat_lng.lat, lat_lng.lng)
      Weather.new(weather)
    end
  end
end
