class Api::V1::ForecastsController < ApplicationController
  def show
    weather = ForecastFacade.retrieve_weather(params[:location])
    render json: ForecastSerializer.new(weather)
  end
end
