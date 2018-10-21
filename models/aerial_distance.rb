class AerialDistance

  def self.get_distance(source, destination)    
    radians = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (destination[0]-source[0]) * radians  # Delta, converted to rad
    dlon_rad = (destination[1]-source[1]) * radians

    lat1_rad, lon1_rad = source.map {|i| i * radians }
    lat2_rad, lon2_rad = destination.map {|i| i * radians }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    return rm * c # Delta in meters
  end

end