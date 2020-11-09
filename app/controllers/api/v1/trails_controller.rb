class Api::V1::TrailsController < ApplicationController

  def index
    location = params[:location]
    render json: TrailsSerializer.new(TrailsFacade.new(location))
  end
end
