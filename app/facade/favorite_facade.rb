class FavoriteFacade
  attr_reader :id, :location, :current_weather
  def initialize(location)
    @id = 1
    @location = location
    @current_weather = ForecastFacade.service(location).currently
  end
end
