class Api::V1::ForecastsController < ApplicationController
  def show
    ForecastFacade.retrieve_weather(params[:location])
  end
end
