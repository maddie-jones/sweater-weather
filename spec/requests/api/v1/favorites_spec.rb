require 'rails_helper'

describe 'Favorites API', :vcr do
  it 'can favorite locations' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")

    params = {
              location: "Denver, CO",
              api_key: user_1.api_key
    }

    post "/api/v1/favorites", params: params

    expect(Favorite.last.location).to eq("Denver, CO")
  end

  it 'can get favorites list' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    favorite_1 = user_1.favorites.create(location: "Denver , CO")
    favorite_2 = user_1.favorites.create(location: "Denver , CO")

    params = {
              api_key: user_1.api_key
    }

    get "/api/v1/favorites", params: params

    favorites_json = JSON.parse(response.body)

    expect(response).to be_successful
    expect(favorites_json["data"][0]["attributes"]).to have_key("location")
    expect(favorites_json["data"][1]["attributes"]).to have_key("current_weather")
  end

end

# GET /api/v1/favorites
# Content-Type: application/json
# Accept: application/json
#
# body:
#
# {
#   "api_key": "jgn983hy48thw9begh98h4539h4"
# }
