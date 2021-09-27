class BooksFacade
  class << self
    def retrieve_books(location, quantity)
      books = OpenLibraryService.get_books(location)
      Books.new(location, books, quantity)
    end
  end
end
