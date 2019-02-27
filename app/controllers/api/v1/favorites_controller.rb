class Api::V1::FavoritesController < ApplicationController
  before_action :authorize

  def create
    @user.favorites.create(location: params[:location])
  end

  def index
    favorites = @user.favorites.map do |favorite|
                  location = favorite.location
                  FavoriteFacade.new(location)
                end
    render json: FavoritesSerializer.new(favorites)
  end

  def delete
    favorite = @user.favorites.find_by(location: params[:location])
    current_weather = FavoriteFacade.new(params[:location])
    favorite.delete
    render status: :ok, json: { location: favorite.location,
                                current_weather: current_weather}
  end

  private

  def authorize
    @user = User.find_by(api_key: params[:api_key])
    unless @user
      raise ActionController::InvalidAuthenticityToken
    end
  end

  rescue_from ActionController::InvalidAuthenticityToken do
    render status: :unauthorized
  end
end
