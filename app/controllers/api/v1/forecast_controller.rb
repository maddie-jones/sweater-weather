class Api::V1::ForecastController < ApplicationController
  def index
    complete_forecast = DarkSkyService.forecast(params[:location])
    render status: :ok, json: ForecastFacade.new(complete_forecast)
  end
end
