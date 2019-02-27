require 'rails_helper'

describe 'Weather API', :vcr do
  xit 'Can get weather by location' do
    location = "denver,co"

    get "/api/v1/gifs?location=#{location}"

    gif_json = JSON.parse(response.body)

    expect(response).to be_successful
    expect(gif_json["data"]["images"].count).to eq(5)
  end
end
