class GifsFacade
  def initialize(location)
    @location = location
  end

  def gif
    service[:data][0][:url]
  end

  def service
    GiphyService.weather_gifs(@location)
  end
end
