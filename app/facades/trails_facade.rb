class TrailsFacade
  attr_reader :location, :forecast, :trails
  def initialize(location)
    @location = location
    @forecast = WeatherFacade.get_location_forecast(location)
    @trails = something
  end


end
