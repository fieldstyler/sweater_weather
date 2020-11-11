require 'rails_helper'

RSpec.describe DirectionsService do
  it 'can make a call and retrieve directions data' do
    from = 'denver,co'
    to = 'Superior, Colorado'
    directions_data = DirectionsService.get_directions(from, to)
    expect(directions_data).to be_a(Hash)
    expect(directions_data).to have_key(:route)
    expect(directions_data[:route]).to be_a(Hash)
    expect(directions_data[:route]).to have_key(:distance)
    expect(directions_data[:route][:distance]).to be_a(Float)
  end
end
