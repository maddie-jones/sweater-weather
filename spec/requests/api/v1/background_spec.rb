require 'rails_helper'

describe 'background API' do
  it 'should return a background by location', :vcr do
    location = "denver,co"
    get "/api/v1/backgrounds?location=#{location}"

    background_json = JSON.parse(response.body)

    expect(response).to be_successful
  end
end
