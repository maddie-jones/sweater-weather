class BackgroundsFacade
  def initialize(location)
    @location = location
    location_data = GoogleGeocodeService.new(location).location_data
    @lng = location_data[:results][0][:geometry][:location][:lng]
    @lat = location_data[:results][0][:geometry][:location][:lat]
  end

  def backgroud_img_url
    farm_id = service[:photos][:photo][0][:farm]
    server_id = service[:photos][:photo][0][:server]
    photo_id = service[:photos][:photo][0][:id]
    photo_secret = service[:photos][:photo][0][:secret]

    "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{photo_id}_#{photo_secret}_h.jpg?"
  end

  def backgroud
    Background.new(backgroud_img_url)
  end

  private

  def service
    FlickrService.backgroud(@lat,@lng)
  end
end
