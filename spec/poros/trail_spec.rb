require 'rails_helper'

RSpec.describe Trail do
  it 'can create a trail object' do
    og_location = 'denver,co'
    destination = 'lakewood,co'
    distance = TrailsFacade.get_distance_to_trail(og_location, destination)
    trail_hash = {
              'name': 'goober trail',
              'summary': "you'll giggle the whole way up",
              'difficulty': 'the pen is blueeeee (Jim Carrey: Liar, Liar)',
              'location': destination,
              'distance_to_trail': distance
              }
    trail = Trail.new(trail_hash, og_location)

    expect(trail).to be_a(Trail)

    expect(trail.name).to eq('goober trail')
    expect(trail.summary).to eq("you'll giggle the whole way up")
    expect(trail.difficulty).to eq('the pen is blueeeee (Jim Carrey: Liar, Liar)')
    expect(trail.location).to eq('lakewood,co')
    expect(trail.distance_to_trail).to eq('7.577')
    expect(trail.name).to be_a(String)
    expect(trail.summary).to be_a(String)
    expect(trail.difficulty).to be_a(String)
    expect(trail.location).to be_a(String)
    expect(trail.distance_to_trail).to be_a(String)
  end
end
