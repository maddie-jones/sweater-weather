class Api::V1::GifsController < ApplicationController
  def index
    gifs = ForecastFacade.new(params[:location]).gifs
    times = ForecastFacade.new(params[:location]).times
    summaries = ForecastFacade.new(params[:location]).summaries
    render status: :ok, json: {data: {images: [{ time: times[0],
                                                 summary: summaries[0],
                                                 url: gifs[0]},
                                               { time: times[1],
                                                 summary: summaries[1],
                                                 url: gifs[1]},
                                               { time: times[2],
                                                 summary: summaries[2],
                                                 url: gifs[2]},
                                               { time: times[3],
                                                 summary: summaries[3],
                                                 url: gifs[3]},
                                               { time: times[4],
                                                 summary: summaries[4],
                                                 url: gifs[4]}
                                                   ]},
                                                 copyright: "2019"}
  end
end
