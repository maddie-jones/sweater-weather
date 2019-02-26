class Forecast
  def initialize(attributes)
    @feels_like = attributes[:apparentTemperature]
    @icon = attributes[:icon]
    @time = attributes[:time]
    @summary = attributes[:summary]
    @humidity = attributes[:humidity]
    @temp = attributes[:temperature]
    @uv_index = attributes[:uvIndex]
    @visibility = attributes[:visibility]
  end
end
