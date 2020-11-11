require 'rails_helper'

RSpec.describe 'Forecast Request Given Location' do

  before :each do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    @forecast_info = JSON.parse(response.body, symbolize_names: true)
    expect(@forecast_info).to be_a(Hash)
    expect(@forecast_info).to have_key(:data)
    expect(@forecast_info[:data]).to be_a(Hash)
    expect(@forecast_info[:data]).to have_key(:id)
    expect(@forecast_info[:data][:id]).to eq(nil)
    expect(@forecast_info[:data]).to have_key(:type)
    expect(@forecast_info[:data][:type]).to eq('forecast')
    expect(@forecast_info[:data]).to have_key(:attributes)
    expect(@forecast_info[:data][:attributes]).to be_a(Hash)
  end

  it 'can make a call and retrieve current weather data' do
    poro_data = @forecast_info[:data][:attributes]
    current_weather = poro_data[:current_weather]
    expect(current_weather).to be_a(Hash)
    expect(current_weather).to have_key(:datetime)
    expect(current_weather[:datetime]).to be_a(String)
    expect(current_weather).to have_key(:sunrise)
    expect(current_weather[:sunrise]).to be_a(String)
    expect(current_weather).to have_key(:sunset)
    expect(current_weather[:sunset]).to be_a(String)
    expect(current_weather).to have_key(:temperature)
    expect(current_weather[:temperature]).to be_a(Float)
    expect(current_weather).to have_key(:feels_like)
    expect(current_weather[:feels_like]).to be_a(Float)
    expect(current_weather).to have_key(:humidity)
    expect(current_weather[:humidity]).to be_an(Integer)
    expect(current_weather).to have_key(:uvi)
    expect(current_weather[:uvi]).to be_a(Float)
    expect(current_weather).to have_key(:visibility)
    expect(current_weather[:visibility]).to be_an(Integer)
    expect(current_weather).to have_key(:conditions)
    expect(current_weather[:conditions]).to be_a(String)
    expect(current_weather).to have_key(:icon)
    expect(current_weather[:icon]).to be_a(String)
  end

  it 'can make a call and retrieve daily weather data' do
    poro_data = @forecast_info[:data][:attributes]
    daily_weather = poro_data[:daily_weather][0]
    expect(daily_weather).to be_a(Hash)
    expect(daily_weather).to have_key(:date)
    expect(daily_weather[:date]).to be_a(String)
    expect(daily_weather).to have_key(:sunrise)
    expect(daily_weather[:sunrise]).to be_a(String)
    expect(daily_weather).to have_key(:sunset)
    expect(daily_weather[:sunset]).to be_a(String)
    expect(daily_weather).to have_key(:max_temp)
    expect(daily_weather[:max_temp]).to be_a(Float)
    expect(daily_weather).to have_key(:min_temp)
    expect(daily_weather[:min_temp]).to be_a(Float)
    expect(daily_weather).to have_key(:conditions)
    expect(daily_weather[:conditions]).to be_a(String)
    expect(daily_weather).to have_key(:icon)
    expect(daily_weather[:icon]).to be_a(String)
    expect(poro_data[:hourly_weather]).to be_an(Array)

  end

  it 'can make a call and retrieve hourly weather data' do
    poro_data = @forecast_info[:data][:attributes]
    hourly_weather = poro_data[:hourly_weather][0]
    expect(hourly_weather).to be_a(Hash)
    expect(hourly_weather).to have_key(:time)
    expect(hourly_weather[:time]).to be_a(String)
    expect(hourly_weather).to have_key(:temp)
    expect(hourly_weather[:temp]).to be_a(Float)
    expect(hourly_weather).to have_key(:wind_speed)
    expect(hourly_weather[:wind_speed]).to be_a(Float)
    expect(hourly_weather).to have_key(:wind_direction)
    expect(hourly_weather[:wind_direction]).to be_a(String)
    expect(hourly_weather).to have_key(:conditions)
    expect(hourly_weather[:conditions]).to be_a(String)
    expect(hourly_weather).to have_key(:icon)
    expect(hourly_weather[:icon]).to be_a(String)
  end

  it 'does not include the following data' do
    poro_data = @forecast_info[:data][:attributes]
    expect(poro_data).to_not have_key(:lat)
    expect(poro_data).to_not have_key(:long)
    expect(poro_data).to_not have_key(:timezone)
    expect(poro_data).to_not have_key(:timezone_offset)
    expect(poro_data).to have_key(:current_weather)
    expect(poro_data[:current_weather]).to_not have_key(:pressure)
    expect(poro_data[:current_weather]).to_not have_key(:dew_point)
    expect(poro_data[:current_weather]).to_not have_key(:clouds)
    expect(poro_data[:current_weather]).to_not have_key(:wind_speed)
    expect(poro_data[:current_weather]).to_not have_key(:wind_deg)
    expect(poro_data).to have_key(:hourly_weather)
    expect(poro_data[:hourly_weather][0]).to_not have_key(:feels_like)
    expect(poro_data[:hourly_weather][0]).to_not have_key(:pressure)
    expect(poro_data[:hourly_weather][0]).to_not have_key(:humidity)
    expect(poro_data[:hourly_weather][0]).to_not have_key(:visibility)
    expect(poro_data).to have_key(:daily_weather)
    expect(poro_data[:daily_weather][0]).to_not have_key(:feels_like)
    expect(poro_data[:daily_weather][0]).to_not have_key(:pressure)
    expect(poro_data[:daily_weather][0]).to_not have_key(:humidity)
    expect(poro_data[:daily_weather][0]).to_not have_key(:dew_point)
    expect(poro_data[:daily_weather][0]).to_not have_key(:wind_speed)
    expect(poro_data[:daily_weather][0]).to_not have_key(:wind_deg)
    expect(poro_data[:daily_weather][0]).to_not have_key(:clouds)
    expect(poro_data[:daily_weather][0]).to_not have_key(:pop)
    expect(poro_data[:daily_weather][0]).to_not have_key(:uvi)
  end
end
