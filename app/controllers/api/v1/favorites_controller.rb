class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    user.favorites.create(location: params[:location])
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    favorites = FavoriteFacade.new(user.favorites[0].location)
    render json: FavoritesSerializer.new(favorites)
  end
end
