class HikingService
  def self.get_weather()
    response = conn.get('data/get-trails') do |req|
      req.params[:lat] = lat
      req.params[:lon] = lng
      # req.params[:units] = 'imperial'
      # req.params[:exclude] = 'minutely'
      req.params[:key] = ENV['HIKING_API_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.hikingproject.com/')
  end
end
