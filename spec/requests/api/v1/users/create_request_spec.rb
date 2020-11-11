require 'rails_helper'

RSpec.describe User do

  before :each do
    User.destroy_all
  end

  it 'can create a user with good credentials' do
    headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
    params = {
                email: 'happypandas@gmail.com',
                password: 'password',
                password_confirmation: 'password'
              }

    post '/api/v1/users', headers: headers, params: params.to_json
    expect(response).to be_successful
    expect(response.status).to eq(201)
    user_info = JSON.parse(response.body, symbolize_names: true)
    expect(user_info).to be_a(Hash)
    expect(user_info).to have_key(:data)
    expect(user_info[:data]).to be_a(Hash)
    expect(user_info[:data]).to have_key(:id)
    expect(user_info[:data][:id]).to be_a(String)
    expect(user_info[:data]).to have_key(:type)
    expect(user_info[:data][:type]).to be_a(String)
    expect(user_info[:data]).to have_key(:attributes)
    expect(user_info[:data][:attributes]).to be_a(Hash)
    expect(user_info[:data][:attributes]).to have_key(:email)
    expect(user_info[:data][:attributes][:email]).to be_a(String)
    expect(user_info[:data][:attributes]).to have_key(:api_key)
    expect(user_info[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'returns an error message if email is already in use' do
    User.create(
                  {
                    email: 'happypandas@gmail.com',
                    password: 'password',
                    password_confirmation: 'password'
                  }
                )
    headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
    params = {
                email: 'happypandas@gmail.com',
                password: 'yeah',
                password_confirmation: 'yeah'
              }

    post '/api/v1/users', headers: headers, params: params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    user_info = JSON.parse(response.body, symbolize_names: true)
    expect(user_info).to be_a(Hash)
    expect(user_info).to have_key(:error)
    expect(user_info[:error]).to eq("This email is already in use")
  end

  it 'returns an error if any params are empty' do
    headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
    params = {
                email: 'happypandas@gmail.com',
                password: '',
                password_confirmation: 'password'
              }

    post '/api/v1/users', headers: headers, params: params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    user_info = JSON.parse(response.body, symbolize_names: true)
    expect(user_info).to be_a(Hash)
    expect(user_info).to have_key(:error)
    expect(user_info[:error]).to eq('You must fill in all fields')
  end

  it 'returns an error message if passwords do not match' do
    headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
    params = {
                email: 'happypandas@gmail.com',
                password: 'password',
                password_confirmation: 'yaboiiiiii'
              }

    post '/api/v1/users', headers: headers, params: params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    user_info = JSON.parse(response.body, symbolize_names: true)
    expect(user_info).to be_a(Hash)
    expect(user_info).to have_key(:error)
    expect(user_info[:error]).to eq('Your passwords do not match')
  end
end
