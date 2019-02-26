class Api::V1::GifsController < ApplicationController
  def index
    forecast = Forecast.new(params[:location]).daily_weather
    images = ForecastFacade.new(params[:location]).images
    #render jason: ImagesSerializer(images)
    render status: :ok, json: {data: {images: images},
                                      copyright: "2019"}
  end
end
