class Api::V1::RoadTripController < ApplicationController
  before_action :validate_session, only: [:create]

  def create
    trip_forecast = RoadTripFacade.retrieve_trip_forecast(trip_params)
    render json: RoadtripSerializer.new(trip_forecast)
  end

  private

  def trip_params
    params.permit(:origin, :destination)
  end
end
