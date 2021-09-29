class Weather
  attr_reader :id,
    :current_weather,
    :daily_weather,
    :hourly_weather

  def initialize(weather)
    @current_weather = current(weather[:current])
    @daily_weather = daily(weather[:daily])
    @hourly_weather = hourly(weather[:hourly], 8)
    @id = nil
  end

  def current(current)
    {
      datetime: Time.at(current[:dt]),
      sunrise: Time.at(current[:sunrise]),
      sunset: Time.at(current[:sunset]),
      temperature: current[:temp],
      feels_like: current[:feels_like],
      humidity: current[:humidity],
      uvi: current[:uvi],
      visibility: current[:visibility],
      conditions: current[:weather][0][:description],
      icon: current[:weather][0][:icon]
    }
  end

  def daily(daily)
    daily.map do |day|
      {
        date: Time.at(day[:dt]).strftime("%F"),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end.first(5)
  end

  def hourly(hourly, hours = 48)
    hourly.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%T"),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end.first(hours)
  end

  def self.destination_forecast(weather, travel_time)
    if travel_time == "Impossible"
      {}
    else
      forecast = new(weather).hourly(weather[:hourly])[(travel_time / 3600)]
      {
        conditions: forecast[:conditions],
        temperature: forecast[:temperature]
      }
    end
  end
end
