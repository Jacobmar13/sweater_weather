class Api::V1::BackgroundsController < ApplicationController
  def show
    image = BackgroundFacade.retrieve_image(params[:location])
    render json: ImageSerializer.new(image)
  end
end
