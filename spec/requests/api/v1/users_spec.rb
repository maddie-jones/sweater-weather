require 'rails_helper'

describe 'Users API' do
  it 'can create user' do
    params = {user: { email: "whatever@example.com",
               password: "password",
               password_confirmation: "password"}}

    post "/api/v1/users", params: params

    user = User.last
    expect(user.email).to eq("whatever@example.com")
  end
  it 'can get api for user' do
    user = User.create(email: "maddy@gmail.com", password: "hello", password_confirmation: "hello")

    get "/api/v1/users/#{user.id}"

    api_json = JSON.parse(response.body)

    expect(response).to be_successful
  end
end
