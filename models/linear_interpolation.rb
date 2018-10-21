require_relative 'aerial_distance'
require_relative 'location_marker'

class LinearInterpolation

  def initialize(source, destination, duration, min_distance=50, start_duration = 0)
    @source = source
    @destination = destination
    @min_distance = min_distance
  end


  def interpolate
    new_coords = []
    distance  = AerialDistance.get_distance(@source, @destination)
    return new_coords if(distance < @min_distance)
    number_of_hops = (distance / @min_distance).to_i    
    lat_steps = @destination[0] - @source[0]
    lng_steps = @destination[1] - @source[1]
    i =0 
    while(i<number_of_hops)
      new_coords << [@source[0] + i * lat_steps, @source[1] + i * lng_steps]
      i = i+1
    end
    return new_coords
  end
end