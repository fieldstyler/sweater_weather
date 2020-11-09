require 'rails_helper'

RSpec.describe GeocodeService do
  it 'can make a call to the facade and retrieve weather data' do
    location = 'denver,co'
    data = GeocodeService.get_geolocation_data(location)
    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
    expect(data[:results]).to be_an(Array)
    expect(data[:results][0]).to be_a(Hash)
    expect(data[:results][0]).to have_key(:locations)
    expect(data[:results][0][:locations]).to be_an(Array)
    expect(data[:results][0][:locations][0]).to have_key(:latLng)

    coordinates = data[:results][0][:locations][0][:latLng]
    expect(coordinates).to be_a(Hash)
    expect(coordinates).to have_key(:lat)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates).to have_key(:lng)
    expect(coordinates[:lng]).to be_a(Float)
  end
end
