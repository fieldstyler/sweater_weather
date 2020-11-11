require 'rails_helper'

RSpec.describe 'Road Trip Request' do

  it 'can successfully login a user' do
    user = User.create(
                  {
                    email: 'happypandas@gmail.com',
                    password: 'password',
                    password_confirmation: 'password'
                  }
                )
    headers = {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
              }
    params = {
              "origin": "Denver,CO",
              "destination": "Pueblo,CO",
              "api_key": user.api_key
              }
    post '/api/v1/road_trip', headers: headers, params: params.to_json
    expect(response).to be_successful
    expect(response.status).to eq(200)
    roadtrip_info = JSON.parse(response.body, symbolize_names: true)
    expect(roadtrip_info).to be_a(Hash)
    expect(roadtrip_info).to have_key(:data)
    expect(roadtrip_info[:data]).to be_a(Hash)
    expect(roadtrip_info[:data]).to have_key(:id)
    expect(roadtrip_info[:data][:id]).to eq(nil)
    expect(roadtrip_info[:data]).to have_key(:type)
    expect(roadtrip_info[:data][:type]).to be_a(String)
    expect(roadtrip_info[:data]).to have_key(:attributes)
    road_trip_attrs = roadtrip_info[:data][:attributes]
    expect(road_trip_attrs).to be_a(Hash)
    expect(road_trip_attrs).to have_key(:start_city)
    expect(road_trip_attrs[:start_city]).to be_a(String)
    expect(road_trip_attrs).to have_key(:end_city)
    expect(road_trip_attrs[:end_city]).to be_a(String)
    expect(road_trip_attrs).to have_key(:travel_time)
    expect(road_trip_attrs[:travel_time]).to be_a(String)
    expect(road_trip_attrs).to have_key(:weather_at_eta)
    expect(road_trip_attrs[:weather_at_eta]).to be_a(Hash)
    expect(road_trip_attrs[:weather_at_eta]).to have_key(:temp)
    expect(road_trip_attrs[:weather_at_eta][:temp]).to be_a(Float)
    expect(road_trip_attrs[:weather_at_eta]).to have_key(:conditions)
    expect(road_trip_attrs[:weather_at_eta][:conditions]).to be_a(String)
  end
end
