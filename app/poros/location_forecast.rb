class LocationForecast
  attr_reader :summary,
              :temperature
  def initialize(attr)
    @summary = attr[:weather][0][:description]
    @temperature = attr[:temp].to_s
  end
end
