class ForecastFacade
  include ActiveModel::Serializers::JSON
  attr_accessor :currently, :daily
  def initialize(complete_forecast)
    @currently = complete_forecast.currently
    @daily = complete_forecast.daily
  end
  def attributes
    {"currently" => nil ,
     "daily" => nil}
  end
end
