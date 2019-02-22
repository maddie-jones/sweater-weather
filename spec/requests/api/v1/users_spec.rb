require 'rails_helper'

describe 'Users API' do
  xit 'Can get weather by location' do


    post "/api/v1/users"

    forecast_json = JSON.parse(response.body)

    expect(response).to be_successful
    #add better test
  end
end
