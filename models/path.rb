require_relative "google_direction_fetch_api"
require_relative 'path_interpolation'
require 'json'
require 'polylines'

class Path

  attr_accessor :source, :destination, :path

  def initialize(source, destination, min_distance = 50, google_key = "AIzaSyBYlpDB2j37YVRgM-qYpzr9q7AvjXJ4oYY")
    @source = source
    @destination = destination    
    # Validation
    raise "Invalid Source" if @source.nil? || @source.split(",").size != 2 
    raise "Invalid Destination" if @destination.nil? || @destination.split(",").size != 2 
    @google_key = google_key
    @min_distance = min_distance
  end


  def get_path 
    points = []
    source_coords = @source.split(",")
    path = []
    start_time = 0
    response = GoogleDirectionFetchApi.new(@google_key, @source, @destination).fetch_data
    @response = JSON.parse(response.body)
    routes = @response['routes'] || []    
    routes.each do |route|      
      legs = route['legs'] || []      
      legs.each do |leg|
        steps = leg['steps']        
        steps.each do |step|
          polyline = step['polyline'] || {}
          duration = step['duration'] || {}
          duration = duration['value'] || 0           
          unless polyline['points'].nil? 
            step_path = Polylines::Decoder.decode_polyline(polyline['points'])                
            path = path + PathInterpolation.new(step_path, duration, @min_distance, start_time).result
          end     
          start_time = start_time + duration     
        end
      end      
    end    
    return path
  end

  def print_path
    path = get_path

    path.each do |location|
      puts "[#{location.latitude}],[#{location.longitude}] ==>  #{location.timestamp}"
    end

    return nil
  end

end