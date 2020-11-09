require 'rails_helper'

RSpec.describe 'Trails Request Given Location' do
  it 'can make a call and retrieve weather data' do
    get '/api/v1/trails?location=denver,co'
    expect(response).to be_successful
    forecast_info = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
