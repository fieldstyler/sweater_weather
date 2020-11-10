require 'rails_helper'

RSpec.describe User do

  it 'can successfully login a user' do
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
                password: 'password'
              }
    post '/api/v1/sessions', headers: headers, params: params.to_json
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

  it 'can give notices for unsuccesful login if user doesnt exist' do
    headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
    params = {
                email: 'happypandas@gmail.com',
                password: 'password'
              }
    post '/api/v1/sessions', headers: headers, params: params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response).to be_a(Hash)
    expect(json_response).to have_key(:error)
    expect(json_response[:error]).to be_a(String)
    expect(json_response[:error]).to eq('One or more fields are incorrect')
  end

  it 'can give notices for unsuccesful login if user exists but passwords dont match' do
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
                password: 'password1'
              }
    post '/api/v1/sessions', headers: headers, params: params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response).to be_a(Hash)
    expect(json_response).to have_key(:error)
    expect(json_response[:error]).to be_a(String)
    expect(json_response[:error]).to eq('One or more fields are incorrect')
  end

  it 'can give notices for unsuccesful login if fields are empty' do
    headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              }
    params = {
                email: 'happypandas@gmail.com',
                password: ''
              }
    post '/api/v1/sessions', headers: headers, params: params.to_json
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response).to be_a(Hash)
    expect(json_response).to have_key(:error)
    expect(json_response[:error]).to be_a(String)
    expect(json_response[:error]).to eq('You must fill in all fields')
  end
end
