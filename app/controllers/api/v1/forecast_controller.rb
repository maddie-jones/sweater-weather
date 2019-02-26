class Api::V1::ForecastController < ApplicationController
  def index
    #geocode data and save
    #darkskyservice and save
    service = DarkSkyService.forecast(params[:location])
    render status: :ok, json: service
  end
end
