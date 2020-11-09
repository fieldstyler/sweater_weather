class Trail
  attr_reader :name, :summary, :difficulty, :location, :distance_to_trail
  def initialize(attr, location)
    @name = attr[:name]
    @summary = attr[:summary]
    @difficulty = attr[:difficulty]
    @location = attr[:location]
    @distance_to_trail = TrailsFacade.get_distance_to_trail(location, attr[:location])
  end
end
