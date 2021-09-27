class Books
  attr_reader :id,
  :destination,
  :forecast,
  :total_books_found,
  :books

  def initialize(location, books, quantity)
    @id = nil
    @destination = location
    @forecast = retrieve_forecast(location)
    @total_books_found = books[:numFound]
    @books = book_formatter(books[:docs], quantity)
  end

  def book_formatter(books, quantity)
    books.map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end.first(quantity.to_i)
  end

  def retrieve_forecast(location)
    forecast = ForecastFacade.retrieve_weather(location)
    {
      summary: forecast.current_weather[:conditions],
      temperature: "#{forecast.current_weather[:temperature].to_i} F"
    }
  end
end
