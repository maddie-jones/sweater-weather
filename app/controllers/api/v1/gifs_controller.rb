class Api::V1::GifsController < ApplicationController
  def index
    gif = GifsFacade.new(params[:location]).gif
    time = ForecastFacade.new(params[:location]).time
   binding.pry
    render status: :ok, json: {data: {images: [{ time: time,
                                                 summary: summary,
                                                 url: gif}]}}
  end
end
