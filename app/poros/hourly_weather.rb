class HourlyWeather
  attr_reader :time,
              :temp,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon
  def initialize(attr)
    @time = Time.at(attr[:dt]).strftime("%k:%M:%S")
    @temp = attr[:temp]
    @wind_speed = attr[:wind_speed]
    @wind_direction = cardinal_direction(attr[:wind_deg])
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end

  def cardinal_direction(wind_degrees)
    if wind_degrees >= 337.5 || wind_degrees <= 22.5
      "N"
    elsif wind_degrees > 22.5 && wind_degrees < 67.5
      "NE"
    elsif wind_degrees >= 67.5 && wind_degrees <= 112.5
      "E"
    elsif wind_degrees > 112.5 && wind_degrees < 157.5
      "SE"
    elsif wind_degrees >= 157.5 && wind_degrees <= 202.5
      "S"
    elsif wind_degrees > 202.5 && wind_degrees < 247.5
      "SW"
    elsif wind_degrees >= 247.5 && wind_degrees <= 292.5
      "W"
    elsif wind_degrees > 292.5 && wind_degrees < 337.5
      "NW"
    end
  end
end
