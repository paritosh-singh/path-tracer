require_relative 'linear_interpolation'
class PathInterpolation

  def initialize path, duration, min_distance, start_time
    @path = path
    @duration = duration
    @min_distance = min_distance
    @start_time = start_time
  end

  def self.interpolate_path path, min_distance
    start_index = 0    
    path_size = path.size
    complete_path = []    
    while(start_index < path_size - 1)      
      complete_path << path[start_index]
      new_path = LinearInterpolation.new(path[start_index], path[start_index+1], min_distance).interpolate      
      complete_path = complete_path + new_path
      start_index = start_index + 1
    end
    return [path[0]] + complete_path + [path[path_size - 1]]
  end


  def self.interpolate_time path, duration, start_time
    path_size = path.size
    avg_time_per_location = duration/path_size.to_f    
    time_slot = []
    path.each_with_index do |location, i|

      time = start_time + (i*avg_time_per_location).to_i      
      time_slot << time
    end
    return time_slot
  end



  def result
    all_path = PathInterpolation.interpolate_path @path, @min_distance
    all_time = PathInterpolation.interpolate_time all_path, @duration, @start_time

    location_markers = []
    all_path.each_with_index do |path, i|
      location_markers << LocationMarker.new(path[0], path[1], all_time[i])
    end

    return location_markers
  end

end