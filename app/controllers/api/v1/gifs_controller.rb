class Api::V1::GifsController < ApplicationController
  def index
    gifs = ForecastFacade.new(params[:location]).gifs
    times = ForecastFacade.new(params[:location]).times
    summaries = ForecastFacade.new(params[:location]).summaries
    images = ForecastFacade.new(params[:location]).images
    #render jason: ImagesSerializer(images)
    render status: :ok, json: {data: {images: images},
                                      copyright: "2019"}
  end
end
