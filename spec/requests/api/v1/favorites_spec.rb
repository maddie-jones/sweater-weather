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

  it 'can delete location' do
    user_1 = User.create(password: "password", email: "whatever@example.com", password_confirmation: "password")
    favorite_1 = user_1.favorites.create(location: "Denver , CO")
    favorite_2 = user_1.favorites.create(location: "Denver , CO")

    params = {
              location: "Denver, CO",
              api_key: user_1.api_key
    }
    expect(user_1.favorites.count).to eq(2)

    delete "/api/v1/favorites", params: params

    deleted_json = JSON.parse(response.body)
    expect(response).to be_successful
    expect(user_1.favorites.count).to eq(1)
    expect(deleted_json["data"]["attributes"]).to have_key("location")
    expect(deleted_json["data"]["attributes"]["location"]).to eq(params[:location])
  end
end
