class GifsFacade
  def initialize(location)
    @location = location
  end

  def gif
    service
  end

  def service
    GiphyService.weather_gifs(@location)
  end
end
