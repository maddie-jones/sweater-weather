class GoogleGeocodeService
  def initialize(location)
    @location = location
  end

  def lat
    location_data[:results][0][:geometry][:location][:lat]
  end

  def lng
    location_data[:results][0][:geometry][:location][:lng]
  end

  def location_data
    get_json("/maps/api/geocode/json?address=#{@location}")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
