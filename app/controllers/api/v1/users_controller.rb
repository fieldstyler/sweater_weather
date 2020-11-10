class Api::V1::UsersController < ApplicationController

  def create
    if params[:email].empty? || params[:password].empty? || params[:password_confirmation].empty?
      render json: { 'error': 'You must fill in all fields' }, status: 400
    elsif User.find_by(email: params[:email]) != nil
      render json: { 'error': 'This email is already in use' }, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: { 'error': 'Your passwords do not match' }, status: 400
    elsif params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      render json: UserSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
