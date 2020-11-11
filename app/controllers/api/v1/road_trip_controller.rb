class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: RoadTripSerializer.new(RoadTripFacade.new(params[:origin], params[:destination]))
    else
      render json: { 'error': 'Api Key is absent or invalid' }, status: 400
    end
  end
end
