class DirectionsService
  def self.get_directions(location)
    response = conn.get('address') do |req|
      req.params[:from] = place1
      req.params[:to] = place2
      req.params[:key] = ENV['GEOCODE_API_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.mapquestapi.com/geocoding/v1/')
  end
end
