class Api::V1::GifsController < ApplicationController
  def index
    gifs = DarkSkyService.forecast(params[:location])[:daily][:data].map do |time|
      GifsFacade.new(time[:icon]).gif
    end
    time = DarkSkyService.forecast(params[:location])[:daily][:data].map do |time|
      time[:time]
    end
    summary = DarkSkyService.forecast(params[:location])[:daily][:data].map do |time|
      time[:summary]
    end
    render status: :ok, json: {data: {images: [{ time: time,
                                                 summary: summary,
                                                 url: gif}]}}
  end
end
