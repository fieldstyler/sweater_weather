class Api::V1::ForecastController < ApplicationController
  def index
    location = params[:location]
    render json: ForecastSerializer.new(WeatherFacade.new(location))
  end
end
