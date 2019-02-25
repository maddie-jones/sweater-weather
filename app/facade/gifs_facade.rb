class GifsFacade
  def initialize(query)
    @query = query
  end

  def gif
    service[:data][rand 0..5][:url]
  end

  def service
    GiphyService.weather_gifs(@query)
  end
end
