class ForecastFacade
  def initialize(location)
    @location = location
  end

  def forecast
    Forecast.new(service)
  end

  def times
    service[:daily][:data].map do |time|
      time[:time]
    end
  end

  def summaries
    service[:daily][:data].map do |time|
      time[:summary]
    end
  end

  def gifs
    service[:daily][:data].map do |time|
      GifsFacade.new(time[:icon]).gif
    end
  end

  def service
   DarkSkyService.forecast(@location)
  end
end
