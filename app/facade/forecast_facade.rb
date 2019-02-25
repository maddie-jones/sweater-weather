class ForecastFacade
  def initialize(location)
    @location = location
  end

  def time
    service[:daily][:data].map do |time|
      time[:time]
      time[:summary]
    end
  end

  def summary
  end

  def forecast
    Forecast.new(service)
  end

  def service
   DarkSkyService.forecast(@location)
  end
end
