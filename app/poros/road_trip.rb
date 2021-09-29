class RoadTrip
  attr_reader :id,
    :start_city,
    :end_city,
    :travel_time,
    :weather_at_eta

  def initialize(trip_params, travel_time, forecast)
    @start_city = trip_params[:origin]
    @end_city = trip_params[:destination]
    @travel_time = time_calculator(travel_time)
    @weather_at_eta = forecast
    @id = nil
  end

  def time_calculator(time)
    if time == "Impossible"
      time
    else
      hour = (time / 3600).to_s.rjust(2, "0")
      minute = (time / 60 % 60).to_s.rjust(2, "0")
      "#{hour}h#{minute}m"
    end
  end
end
