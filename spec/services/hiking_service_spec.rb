require 'rails_helper'

RSpec.describe HikingService do
  it 'can make a call and retrieve trail data' do
    lat = 39.9388
    lng = -105.2582
    trails_data = HikingService.get_trails(lat, lng)
    expect(trails_data).to be_a(Hash)
    expect(trails_data).to have_key(:trails)
    expect(trails_data[:trails]).to be_an(Array)
    expect(trails_data[:trails][0]).to be_a(Hash)
    trail_info = trails_data[:trails][0]
    expect(trail_info).to have_key(:name)
    expect(trail_info[:name]).to be_a(String)
    expect(trail_info).to have_key(:summary)
    expect(trail_info[:summary]).to be_a(String)
    expect(trail_info).to have_key(:difficulty)
    expect(trail_info[:difficulty]).to be_a(String)
    expect(trail_info).to have_key(:location)
    expect(trail_info[:location]).to be_a(String)
  end
end
