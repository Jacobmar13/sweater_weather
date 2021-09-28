class Api::V1::BooksController < ApplicationController
  def index
    books = BooksFacade.retrieve_books(params[:location], params[:quantity])
    render json: BooksSerializer.new(books)
  end
end
