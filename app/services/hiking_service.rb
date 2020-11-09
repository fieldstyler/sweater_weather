class HikingService
  def self.get_trails(lat, lng)
    response = conn.get('data/get-trails') do |req|
      req.params[:lat] = lat
      req.params[:lon] = lng
      req.params[:key] = ENV['HIKING_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.hikingproject.com/')
  end
end
