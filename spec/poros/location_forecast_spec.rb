require 'rails_helper'

RSpec.describe LocationForecast do
  it 'can create a location forecast object' do
    forecast_hash = {
              'weather': [{description: 'raining sad pandas'}],
              'temp': '425'
              }
    forecast = LocationForecast.new(forecast_hash)

    expect(forecast).to be_a(LocationForecast)

    expect(forecast.summary).to eq('raining sad pandas')
    expect(forecast.temperature).to eq('425')
  end
end
