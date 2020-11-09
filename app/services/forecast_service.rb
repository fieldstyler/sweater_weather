class ForecastService
  def self.get_weather(lat, lng)
    response = conn.get('onecall') do |req|
      req.params[:lat] = lat
      req.params[:lon] = lng
      req.params[:units] = 'imperial'
      req.params[:exclude] = 'minutely'
      req.params[:appid] = ENV['OPEN_WEATHER_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org/data/2.5/')
  end
end
