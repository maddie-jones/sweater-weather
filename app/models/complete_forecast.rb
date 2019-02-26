class CompleteForecast
  attr_reader :geocode, :currently, :hourly, :daily
  def initialize(geocode, currently, daily, hourly)
    @geocode = geocode
    @currently = Forecast.new(currently)
    @hourly = hourly[:data].map {|hour| Forecast.new(hour)}
    @daily= daily[:data].map {|day| Forecast.new(day)}
  end
end
