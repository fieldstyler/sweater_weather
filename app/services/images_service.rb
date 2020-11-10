class ImagesService
  def self.get_image(location)
    response = conn.get('search/photos') do |req|
      req.params['query'] = location
      req.params['per_page'] = 1
      req.headers['Accept-Version'] = 'v1'
      req.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com/')
  end
end
