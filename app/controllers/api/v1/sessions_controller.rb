class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if params[:email].empty? || params[:password].empty?
      render json: { 'error': 'You must fill in all fields' }, status: 400
    elsif user == nil || !user.authenticate(params[:password])
      render json: { 'error': 'One or more fields are incorrect' }, status: 400
    elsif user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 201
    else
    end
  end
end
