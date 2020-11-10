class BackgroundImage
  attr_reader :location, :image_url, :credit
  def initialize(location, attr)
    @location = location
    @image_url = attr[:results][0][:urls][:raw]
    @credit = {
              source: 'https://images.unsplash.com/',
              author: attr[:results][0][:user][:name]
              }
  end
end
