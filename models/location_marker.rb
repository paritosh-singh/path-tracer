class LocationMarker
  attr_reader :latitude, :longitude, :timestamp

  def initialize(latitude, longitude, timestamp)
    @latitude = latitude
    @longitude = longitude
    @timestamp = timestamp
  end

end