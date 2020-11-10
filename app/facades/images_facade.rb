class ImagesFacade
  attr_reader :location, :image
  def initialize(location)
    @location = location
    @image = ImagesFacade.get_image_info(location)
  end

  def self.get_image_info(location)
    image_info = ImagesService.get_image(location)
    BackgroundImage.new(location, image_info)
  end
end
