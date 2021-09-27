class ForecastFacade
  class << self
    def coordinates(address)
      location = MapquestService.get_location(address)[:results][0][:locations][0][:latLng]
      LatLng.new(location)
    end

    def retrieve_weather(address)
      lat_lng = coordinates(address)
      require 'pry';binding.pry
    end
  end
end
