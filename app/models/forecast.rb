class Forecast
  attr_reader :id, :current_weather, :minute_weather, :hour_weather, :daily_weather
  def initialize(attributes)
    @current_weather = attributes[:currently]
    @minute_weather = attributes[:minutely]
    @hour_weather = attributes[:hourly]
    @daily_weather = attributes[:daily]
  end
end
