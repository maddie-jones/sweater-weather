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
end
