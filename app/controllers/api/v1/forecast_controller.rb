class Api::V1::ForecastController < ApplicationController
  def index
    forecast_hash = DarkSkyService.forecast(params[:location])
    forecast = Forecast.new(forecast_hash)
    render json: ForecastSerializer.new(forecast)
  end
end
