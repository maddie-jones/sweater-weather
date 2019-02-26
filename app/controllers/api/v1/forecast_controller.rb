class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.service(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
