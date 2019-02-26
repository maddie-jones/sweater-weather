require 'rails_helper'

describe 'Login Api', :vcr do
  it 'can login a user' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    user_2 = User.create(password: "password", email: "maddie@example.com", password_confirmation: "password")
    params = {
              email: "whatever@example.com",
              password: "password"
    }

    post "/api/v1/sessions", params: params

    expect(response).to have_http_status(:ok)

    expect(JSON.parse(response.body)).to eq({"api_key" => user_1.api_key})
  end
  
  it 'cannot login user with wrong password' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    user_2 = User.create(password: "password", email: "maddie@example.com", password_confirmation: "password")
    params = {
              email: "whatever@example.com",
              password: "hello"
    }

    post "/api/v1/sessions", params: params

    expect(response).to have_http_status(:unauthorized)

    expect(JSON.parse(response.body)).to eq({"error" => "401 unauthorized"})
  end
end
