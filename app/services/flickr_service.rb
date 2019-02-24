class FlickrService
  def self.backgroud(lat, lon)
    conn = Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:method] = "flickr.photos.search"
      faraday.params[:api_key] = ENV["FLICKR_API_KEY"]
      faraday.params[:lat] = lat
      faraday.params[:lon] = lon
      faraday.params[:format] = "json"
    end
    response = conn.get '/services/rest'
    json = response.body.gsub("jsonFlickrApi(", "").chop
    JSON.parse(json, symbolize_names: true)
  end
end
