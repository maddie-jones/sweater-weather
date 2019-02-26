class ForecastFacade
  attr_reader :id, :currently, :hourly, :daily, :timezone
  def initialize(data)
    @id = 1
    @currently = data[:currently]
    @hourly = data[:hourly]
    @daily = data[:daily]
    @timezone = data[:timezone]
  end

  def self.service(location)
    data = DarkSkyService.forecast(location)
    new(data)
  end

  def images
    Image.new
  end
end
