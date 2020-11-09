require 'rails_helper'

RSpec.describe TrailsFacade do
  it 'can call get distance_to_trail data method and return trail data' do
    location = 'denver,co'
    destination = 'lakewood,co'
    distance_to_trail = TrailsFacade.get_distance_to_trail(location, destination)
    expect(distance_to_trail).to be_a(String)
  end
end
