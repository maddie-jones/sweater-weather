require 'rails_helper'

describe 'Users API', :vcr do
  it 'can create user' do
    params = { email: "whatever@example.com",
               password: "password",
               password_confirmation: "password"}

    post "/api/v1/users", params: params

    expect(response).to have_http_status(:created)

    user = User.find_by(email: params[:email])

    expect(JSON.parse(response.body)).to eq({"api_key" => user.api_key})
  end
end
