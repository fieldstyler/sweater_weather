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
      Trail.new(trail_attrs, location)
    end
  end

  def self.get_distance_to_trail(current_location, destination)
    directions_info = DirectionsService.get_directions(current_location, destination)
    directions_info[:route][:distance].to_s
  end

end
