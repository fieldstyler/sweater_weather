class Forecast
  attr_reader :temp,
              :conditions
  def initialize(attr)
    @temp = attr[:temp]
    @conditions = attr[:weather][0][:description]
  end
end
