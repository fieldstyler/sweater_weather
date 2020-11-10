class Api::V1::ImagesController < ApplicationController
  def show
    location = params[:location]
    render json: ImagesSerializer.new(ImagesFacade.new(location))
  end
end
