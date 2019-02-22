class ForecastFacade

  def initialize(location)
    @location = location
  end

  def forecast
    Forecast.new(service)
  end

  def service
   DarkSkyService.forecast(@location)
  end
end
