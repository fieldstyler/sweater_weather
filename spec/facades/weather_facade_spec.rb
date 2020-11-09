require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'can call the get coordinates method and get coordinates by location' do
    location = 'denver,co'
    coordinates = WeatherFacade.get_coordinates(location)
    expect(coordinates).to be_an(Array)
    expect(coordinates.size).to eq(2)
    expect(coordinates[0]).to be_a(Float)
  end

  it 'can call get weather data method and return same forecast data returned by forecast service' do
    location = 'denver,co'
    lat = 39.738453
    lng = -104.984853
    forecast_info = WeatherFacade.get_weather_data(location)
    expect(forecast_info).to eq(ForecastService.get_weather(lat, lng))
  end
end
