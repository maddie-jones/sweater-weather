class Forecast
  attr_reader :id, :current_weather, :minute_weather, :hour_weather
  def initialize(attributes)
    @id =  nil
    @current_weather = attributes[:currently]
    @minute_weather = attributes[:minutely]
    @hour_weather = attributes[:hourly]
  end
end
