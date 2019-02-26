require 'rails_helper'

describe 'Favorites API' do
  it 'can favorite locations' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    params = {
              email: "whatever@example.com",
              password: "password"
    }

    post "/api/v1/sessions", params: params

    expect(response).to have_http_status(:ok)

    expect(JSON.parse(response.body)).to eq({"api_key" => user_1.api_key})
  end
end
