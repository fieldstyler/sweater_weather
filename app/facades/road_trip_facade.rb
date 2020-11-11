class RoadTripFacade
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta
  def initialize(origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = RoadTripFacade.get_travel_time(origin, destination)
    @weather_at_eta = RoadTripFacade.get_destination_forecast(origin, destination)
  end

  def self.get_travel_time(current_location, destination)
    directions_info = DirectionsService.get_directions(current_location, destination)
    directions_info[:route][:formattedTime] ||= "Impossible Route"
  end

  def self.get_destination_forecast(origin, destination)
    travel_time = RoadTripFacade.get_travel_time(origin, destination)
    if travel_time == "Impossible Route"
      travel_time_index = nil
    elsif travel_time.to_i > 24
      hour = (travel_time.to_i % 24).to_s
      travel_time[0,2] = hour
      if travel_time.to_time.min > 30
        travel_time_index = travel_time.to_time.hour + 25
      else
        travel_time_index = travel_time.to_time.hour + 24
      end
    elsif travel_time.to_time.min > 30
      travel_time_index = travel_time.to_time.hour + 1
    else
      travel_time_index = travel_time.to_time.hour
    end
    forecast_info = WeatherFacade.get_weather_data(destination)
    hourly_forecast_info = forecast_info[:hourly]
    if travel_time_index
      Forecast.new(hourly_forecast_info[travel_time_index])
    else
      "No weather on impossible route"
    end
  end
end
