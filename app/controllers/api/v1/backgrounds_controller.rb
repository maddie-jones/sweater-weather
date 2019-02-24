class Api::V1::BackgroundsController < ApplicationController
  def index
    facade = BackgroundsFacade.new(params[:location]).backgroud
    render json: BackgroundsSerializer.new(facade)
  end
end
