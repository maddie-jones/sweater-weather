class Api::V1::ForecastController < ApplicationController
  def index
    facade = ForecastFacade.new(params[:location]).forecast
    render json: ForecastSerializer.new(facade)
  end
end
