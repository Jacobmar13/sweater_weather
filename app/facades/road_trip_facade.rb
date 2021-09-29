class RoadTripFacade
  class << self
    def coordinates(address)
      location = MapquestService.get_location(address)[:results][0][:locations][0][:latLng]
      LatLng.new(location)
    end

    def destination_time(trip_params)
      travel_time = MapquestService.get_travel_time(trip_params)
      travel_time[:route][:time]
    end

    def retrieve_trip_forecast(trip_params)
      lat_lng = coordinates(trip_params[:destination])
      travel_time = destination_time(trip_params)
      weather = OpenWeatherService.get_weather(lat_lng.lat, lat_lng.lng)
      forecast = Weather.destination_forecast(weather, travel_time)
      RoadTrip.new(trip_params, travel_time, forecast)
    end
  end
end
