class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    user.favorites.create(location: params[:location])
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    favorites = user.favorites.map do |favorite|
                  location = favorite.location
                  FavoriteFacade.new(location)
                end
    if user
      render json: FavoritesSerializer.new(favorites)
    else
      render status: :unauthorized, json: {error: "401 unauthorized"}
    end
  end

  def delete
    user = User.find_by(api_key: params[:api_key])
    favorite = user.favorites.find_by(location: params[:location])
    current_weather = FavoriteFacade.new(params[:location])
    favorite.delete
    if user
      render status: :ok, json: { location: favorite.location,
                                current_weather: current_weather}
    else
      render status: :unauthorized, json: {error: "401 unauthorized"}
    end
  end
end
