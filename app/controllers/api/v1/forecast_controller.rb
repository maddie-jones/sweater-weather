class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(forecast)
  end

  private

  def forecast
   Rails.cache.fetch("Forecast-#{params[:location]}-#{Time.zone.now.strftime('%F')}") { ForecastFacade.service(params[:location]) }
  end
  #move this to forecast facade by wrapping the slef.service method and change name 
end
