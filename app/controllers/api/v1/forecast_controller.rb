class Api::V1::ForecastController < ApplicationController
  def index
    location = GoogleGeocodeService.new(params[:location])
    forecast = DarkSkyFacade.current_forecast(location)
    render json: ForecastSerializer.new(forecast)
  end
end
