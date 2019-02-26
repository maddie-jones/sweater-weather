require 'rails_helper'

describe 'Favorites API' do
  it 'can favorite locations' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")

    params = {
              location: "Denver, CO",
              api_key: user_1.api_key
    }

    post "/api/v1/favorites", params: params

    expect(Favorite.last.location).to eq("Denver, CO")
  end
end
