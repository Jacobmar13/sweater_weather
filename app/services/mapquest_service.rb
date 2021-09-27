class MapquestService
  class << self
    def get_location(address)
      conn = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |req|
        req.params["key"] = ENV["MAPQUEST_ACCESS_KEY"]
        req.params["location"] = address
      end
      JSON.parse(conn.body, symbolize_names: true)
    end
  end
end
