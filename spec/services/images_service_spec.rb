require 'rails_helper'

RSpec.describe ImagesService do
  it 'can call get image method and return image url, author, and logo' do
    location = 'denver,co'
    data = ImagesService.get_image(location)
    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
    expect(data[:results]).to be_an(Array)
    expect(data[:results][0]).to have_key(:urls)
    expect(data[:results][0][:urls]).to be_a(Hash)
    expect(data[:results][0][:urls]).to have_key(:raw)
    expect(data[:results][0][:urls][:raw]).to be_a(String)
    expect(data[:results][0]).to have_key(:user)
    expect(data[:results][0][:user]).to be_a(Hash)
    expect(data[:results][0][:user]).to have_key(:name)
    expect(data[:results][0][:user][:name]).to be_a(String)
  end
end
