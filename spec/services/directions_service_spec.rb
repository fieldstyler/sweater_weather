require 'rails_helper'

RSpec.describe DirectionsService do
  it 'can make a call and retrieve directions data' do
    from = 'denver,co'
    to = 'Superior, Colorado'
    directions_data = DirectionsService.get_directions(from, to)
    expect(directions_data).to be_a(Hash)
    expect(directions_data).to have_key(:route)
    expect(directions_data[:route]).to be_a(Hash)
    expect(directions_data[:route]).to have_key(:hasTollRoad)
    expect(directions_data[:route]).to have_key(:hasBridge)
    expect(directions_data[:route]).to have_key(:boundingBox)
    expect(directions_data[:route][:boundingBox]).to be_a(Hash)
    expect(directions_data[:route]).to have_key(:distance)
    expect(directions_data[:route][:distance]).to be_a(Float)
    expect(directions_data[:route]).to have_key(:hasTimedRestriction)
    expect(directions_data[:route]).to have_key(:hasTunnel)
    expect(directions_data[:route]).to have_key(:hasHighway)
    expect(directions_data[:route]).to have_key(:computedWaypoints)
    expect(directions_data[:route][:computedWaypoints]).to be_an(Array)
    expect(directions_data[:route]).to have_key(:routeError)
    expect(directions_data[:route][:routeError]).to be_a(Hash)
    expect(directions_data[:route]).to have_key(:formattedTime)
    expect(directions_data[:route][:formattedTime]).to be_a(String)
    expect(directions_data[:route]).to have_key(:sessionId)
    expect(directions_data[:route][:sessionId]).to be_a(String)
    expect(directions_data[:route]).to have_key(:hasAccessRestriction)
    expect(directions_data[:route]).to have_key(:realTime)
    expect(directions_data[:route][:realTime]).to be_a(Integer)
    expect(directions_data[:route]).to have_key(:hasSeasonalClosure)
    expect(directions_data[:route]).to have_key(:hasCountryCross)
    expect(directions_data[:route]).to have_key(:fuelUsed)
    expect(directions_data[:route][:fuelUsed]).to be_a(Float)
    expect(directions_data[:route]).to have_key(:legs)
    expect(directions_data[:route][:legs]).to be_an(Array)
  end

  it 'can make a call on an impossible trip and return an error' do
    from = 'New York, NY'
    to = 'London, UK'
    directions_data = DirectionsService.get_directions(from, to)
    expect(directions_data).to be_a(Hash)
    expect(directions_data).to have_key(:route)
    expect(directions_data[:route]).to be_a(Hash)
    expect(directions_data).to have_key(:info)
    expect(directions_data[:info]).to be_a(Hash)
    expect(directions_data).to have_key(:info)
    expect(directions_data[:info]).to have_key(:statuscode)
    expect(directions_data[:info][:statuscode]).to eq(402)
    expect(directions_data[:info]).to have_key(:messages)
    expect(directions_data[:info][:messages]).to be_an(Array)
    expect(directions_data[:info][:messages][0]).to eq("We are unable to route with the given locations.")
  end 
end
