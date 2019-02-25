class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new(params[:location]).forecast
    render status: :ok, json: {data: {forecast: forecast}}
  end
end
