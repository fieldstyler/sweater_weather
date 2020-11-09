require 'rails_helper'

RSpec.describe 'Trails Request Given Location' do
  it 'can make a call and retrieve weather data' do
    get '/api/v1/trails?location=denver,co'
    expect(response).to be_successful
    trail_info = JSON.parse(response.body, symbolize_names: true)
    expect(trail_info).to be_a(Hash)
    expect(trail_info).to have_key(:data)
    expect(trail_info[:data]).to be_a(Hash)
    expect(trail_info[:data]).to have_key(:id)
    expect(trail_info[:data][:id]).to eq(nil)
    expect(trail_info[:data]).to have_key(:type)
    expect(trail_info[:data][:type]).to eq('trail')
    expect(trail_info[:data]).to have_key(:attributes)
    expect(trail_info[:data][:attributes]).to be_a(Hash)
    expect(trail_info[:data][:attributes]).to have_key(:location)
    expect(trail_info[:data][:attributes][:location]).to be_a(String)
    expect(trail_info[:data][:attributes]).to have_key(:forecast)
    expect(trail_info[:data][:attributes][:forecast]).to be_a(Hash)
    forecast_info = trail_info[:data][:attributes][:forecast]
    expect(forecast_info).to have_key(:summary)
    expect(forecast_info[:summary]).to be_a(String)
    expect(forecast_info).to have_key(:temperature)
    expect(forecast_info[:temperature]).to be_a(String)
    expect(trail_info[:data][:attributes]).to have_key(:trails)
    trail_attrs = trail_info[:data][:attributes][:trails]
    expect(trail_attrs).to be_an(Array)
    expect(trail_attrs[0]).to be_a(Hash)
    expect(trail_attrs[0]).to have_key(:name)
    expect(trail_attrs[0][:name]).to be_a(String)
    expect(trail_attrs[0]).to have_key(:summary)
    expect(trail_attrs[0][:summary]).to be_a(String)
    expect(trail_attrs[0]).to have_key(:difficulty)
    expect(trail_attrs[0][:difficulty]).to be_a(String)
    expect(trail_attrs[0]).to have_key(:location)
    expect(trail_attrs[0][:location]).to be_a(String)
    expect(trail_attrs[0]).to have_key(:distance_to_trail)
    expect(trail_attrs[0][:distance_to_trail]).to be_a(String)
  end
end
