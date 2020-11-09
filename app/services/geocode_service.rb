class GeocodeService
  def self.get_geolocation_data(location)
    response = conn.get('address') do |req|
      req.params[:location] = location
      req.params[:key] = ENV['GEOCODE_API_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.mapquestapi.com/geocoding/v1/')
  end
end
