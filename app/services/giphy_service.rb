class GiphyService
  def self.weather_gifs(location)
    query = DarkSkyService.forecast(location)[:daily][:icon]
  end
end
