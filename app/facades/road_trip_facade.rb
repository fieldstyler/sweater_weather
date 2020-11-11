class RoadTripFacade
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta
  def initialize(origin, destination)
    @start_city = origin
    @end_city = destination
    require "pry"; binding.pry
    @travel_time = 'WeatherFacade'
    @weather_at_eta = 'WeatherFacade'
  end
end
