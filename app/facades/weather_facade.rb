class WeatherFacade
  attr_reader :location, :daily_weather, :hourly_weather, :current_weather
  def initialize(location)
    @location = location
    @daily_weather = WeatherFacade.get_daily_weather(location)
    @hourly_weather = WeatherFacade.get_hourly_weather(location)
    @current_weather = WeatherFacade.get_current_weather(location)
  end

  def self.get_current_weather(location)
    forecast_data = WeatherFacade.get_weather_data(location)
    data = forecast_data[:current]
    CurrentWeather.new(data)
  end

  def self.get_daily_weather(location)
    forecast_data = WeatherFacade.get_weather_data(location)
    forecast_data[:daily].first(5).map do |weather_attrs|
      DailyWeather.new(weather_attrs)
    end
  end

  def self.get_hourly_weather(location)
    forecast_data = WeatherFacade.get_weather_data(location)
    forecast_data[:hourly].first(8).map do |weather_attrs|
      HourlyWeather.new(weather_attrs)
    end
  end

  def self.get_location_forecast(location)
    forecast_data = WeatherFacade.get_weather_data(location)
    data = forecast_data[:current]
    x = LocationForecast.new(data)
    require "pry"; binding.pry
  end

  def self.get_weather_data(location)
    data = WeatherFacade.get_coordinates(location)
    lat = data[0]
    lng = data[1]
    ForecastService.get_weather(lat, lng)
  end

  def self.get_coordinates(location)
    data = GeocodeService.get_geolocation_data(location)
    data_info = data[:results][0][:locations][0][:latLng]
    lat = data_info[:lat]
    lng = data_info[:lng]
    [lat, lng]
  end
end
