class GiphyService
  def self.weather_gifs(location)
    query = DarkSkyService.forecast(location)[:daily][:icon]
    conn = Faraday.new(url: 'http://api.giphy.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:api_key] = ENV["GIPHY_API_KEY"]
      faraday.params[:q] = "snow"
    end
    response = conn.get '/v1/gifs/search'
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end
end
