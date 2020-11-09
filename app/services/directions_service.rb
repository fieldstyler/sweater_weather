class DirectionsService
  def self.get_directions(from, to)
    response = conn.get('route') do |req|
      req.params[:from] = from
      req.params[:to] = to
      req.params[:key] = ENV['GEOCODE_API_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.mapquestapi.com/directions/v2/')
  end
end
