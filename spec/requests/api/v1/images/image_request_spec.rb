require 'rails_helper'

RSpec.describe 'Image Request Given Location' do
  it 'can make a call and retrieve images that relate to the weather data' do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    expect(response.status).to eq(200)
    image_info = JSON.parse(response.body, symbolize_names: true)
    expect(image_info).to be_a(Hash)
    expect(image_info).to have_key(:data)
    expect(image_info[:data]).to be_a(Hash)
    expect(image_info[:data]).to have_key(:id)
    expect(image_info[:data][:id]).to eq(nil)
    expect(image_info[:data]).to have_key(:type)
    expect(image_info[:data][:type]).to be_a(String)
    expect(image_info[:data][:type]).to eq('image')
    expect(image_info[:data]).to have_key(:attributes)
    expect(image_info[:data][:attributes]).to be_a(Hash)
    expect(image_info[:data][:attributes]).to have_key(:image)
    image_info = image_info[:data][:attributes][:image]
    expect(image_info).to be_a(Hash)
    expect(image_info).to have_key(:location)
    expect(image_info[:location]).to be_a(String)
    expect(image_info).to have_key(:image_url)
    expect(image_info[:image_url]).to be_a(String)
    expect(image_info).to have_key(:credit)
    expect(image_info[:credit]).to be_a(Hash)
    expect(image_info[:credit]).to have_key(:source)
    expect(image_info[:credit][:source]).to be_a(String)
    expect(image_info[:credit]).to have_key(:author)
    expect(image_info[:credit][:author]).to be_a(String)
  end
end
