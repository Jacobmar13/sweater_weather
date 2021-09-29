class MapquestService
  class << self
    def connection
      Faraday.new("http://www.mapquestapi.com")
    end

    def get_location(address)
      response = connection.get("/geocoding/v1/address") do |req|
        req.params["key"] = ENV["MAPQUEST_ACCESS_KEY"]
        req.params["location"] = address
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_travel_time(trip_params)
      response = connection.get("/directions/v2/route") do |req|
        req.params["key"] = ENV["MAPQUEST_ACCESS_KEY"]
        req.params["from"] = trip_params[:origin]
        req.params["to"] = trip_params[:destination]
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
