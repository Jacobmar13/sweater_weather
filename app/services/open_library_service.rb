class OpenLibraryService
  class << self
    def connection
      Faraday.new("http://openlibrary.org")
    end

    def get_books(location)
      response = connection.get("/search.json?q=#{location.tr(",","+")}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
