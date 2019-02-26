class Api::V1::GifsController < ApplicationController
  def index
    images = ForecastFacade.service(params[:location]).images
    #render jason: ImagesSerializer(images)
    render status: :ok, json: {data: {images: images},
                                      copyright: "2019"}
  end
end
