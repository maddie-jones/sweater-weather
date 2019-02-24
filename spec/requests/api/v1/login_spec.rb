require 'rails_helper'

describe 'Weather API', :vcr do
  it 'Can get weather by location' do
    user = User.create(email: "maddy@gmail.com", password: "hello", password_confirmation: "hello")

    post "/api/v1/sessions"

    forecast_json = JSON.parse(response.body)

    expect(response).to be_successful
  end
end
