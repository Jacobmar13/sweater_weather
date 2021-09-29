class RoadTrip
  attr_reader :id,
    :start_city,
    :end_city,
    :travel_time,
    :weather_at_eta

  def initialize(trip_params, travel_time, forecast)
    @start_city = trip_params[:origin]
    @end_city = trip_params[:destination]
    @travel_time = Time.at(travel_time).utc.strftime "%Hh%Mm"
    @weather_at_eta = forecast
    @id = nil
  end
end
