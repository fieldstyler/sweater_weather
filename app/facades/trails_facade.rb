class TrailsFacade
  attr_reader :location, :forecast, :trails
  def initialize(location)
    @location = location
    @forecast = WeatherFacade.get_location_forecast(location)
    @trails = TrailsFacade.get_trail_info(location)
  end

  def self.get_trail_info(location)
    data = WeatherFacade.get_coordinates(location)
    lat = data[0]
    lng = data[1]
    trails_info = HikingService.get_trails(lat, lng)
    trails_info[:trails].map do |trail_attrs|
      Trail.new(trail_attrs)
    end 
    require "pry"; binding.pry
  end

end
