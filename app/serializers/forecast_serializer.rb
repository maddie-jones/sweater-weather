class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather, :minute_weather, :hour_weather, :daily_weather
end
