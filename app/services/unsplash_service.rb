class UnsplashService
  class << self
    def connection
      Faraday.new("https://api.unsplash.com")
    end

    def get_image(address)
      response = connection.get("/search/photos") do |req|
        req.headers["Accept-Version"] = "v1"
        req.headers["Authorization"] = ENV["UNSPLASH_ACCESS_KEY"]
        req.params["query"] = address
        req.params["per_page"] = 1
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
