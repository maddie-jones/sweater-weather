class Forecast
  attr_reader :feels_like, :humidity, :time, :summary, :uv_index, :visibility, :temp
  def initialize(attributes)
    @feels_like = attributes[:apparentTemperature]
    @time = attributes[:time]
    @summary = attributes[:summary]
    @humidity = attributes[:humidity]
    @temp = attributes[:temperature]
    @uv_index = attributes[:uvIndex]
    @visibility = attributes[:visibility]
  end
end
