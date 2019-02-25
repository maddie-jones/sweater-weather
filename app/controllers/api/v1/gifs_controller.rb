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
    render status: :ok, json: {data: {images: [{ time: time[0],
                                                 summary: summary[0],
                                                 url: gifs[0]},
                                               { time: time[1],
                                                 summary: summary[1],
                                                 url: gifs[1]},
                                               { time: time[2],
                                                 summary: summary[2],
                                                 url: gifs[2]},
                                               { time: time[3],
                                                 summary: summary[3],
                                                 url: gifs[3]},
                                               { time: time[4],
                                                 summary: summary[4],
                                                 url: gifs[4]}
                                                   ]}}
  end
end
