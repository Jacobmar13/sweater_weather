class OpenWeatherService
  class << self
    def connection
      Faraday.new("https://api.openweathermap.org")
    end

    def get_weather(lat, lng)
      response = connection.get("/data/2.5/onecall") do |req|
        req.params["lat"] = lat
        req.params["lon"] = lng
        req.params["appid"] = ENV["OPEN_WEATHER_ACCESS_KEY"]
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
