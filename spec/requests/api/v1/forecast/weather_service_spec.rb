require 'rails_helper'

RSpec.describe WeatherService do
  it 'can make a call and retrieve weather data' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    location_info = JSON.parse(response.body, symbolize_names: true)
    expect(location_info).to be_a(Hash)
    expect(location_info).to have_key(:results)
    expect(location_info[:results]).to be_an(Array)
    expect(location_info[:results][0]).to be_a(Hash)
    expect(location_info[:results][0]).to have_key(:locations)
    expect(location_info[:results][0][:locations]).to be_an(Array)
    expect(location_info[:results][0][:locations][0]).to have_key(:latLng)

    coordinates = location_info[:results][0][:locations][0][:latLng]
    expect(coordinates).to be_a(Hash)
    expect(coordinates).to have_key(:lat)
    expect(coordinates[:lat]).to be_a(Float)
    expect(coordinates).to have_key(:lng)
    expect(coordinates[:lng]).to be_a(Float)
  end
end
