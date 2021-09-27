class ForecastFacade
  class << self
    def retrieve_weather(address)
      lat_lng = MapquestService.get_location(address)[:results][0][:locations][0][:latLng]
    end
  end
end
