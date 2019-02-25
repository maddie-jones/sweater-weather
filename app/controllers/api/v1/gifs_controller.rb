class Api::V1::GifsController < ApplicationController
  def index
    facade = GifsFacade.new(params[:location]).gif
    render json: GifsSerializer.new(facade)
  end
end
