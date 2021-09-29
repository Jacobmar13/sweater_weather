class RoadTrip
  def initialize(trip_params, travel_time, forecast)
    @start_city = trip_params[:origin]
    @end_city = trip_params[:destination]
    @travel_time = Time.at(travel_time).utc.strftime "%Hh%Mm"
    @weather_at_eta = forecast
  end
end
