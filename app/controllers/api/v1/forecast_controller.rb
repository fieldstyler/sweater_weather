class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    render json: WeatherService.get_weather_data(location)
  end
end
