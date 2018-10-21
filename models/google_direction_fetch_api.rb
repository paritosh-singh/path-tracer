# Class to fetch data from directions api
require 'net/http'
require 'uri'

class GoogleDirectionFetchApi


  attr_accessor 
  @@direction_api_endpoint = "https://maps.googleapis.com/maps/api/directions/json"


  def initialize(key, source, destination)    
    raise "Invalid latitude or longitude" if source.nil? || destination.nil?
    @key = key  
    @source = source
    @destination = destination
  end

  def fetch_data
    uri = URI.parse(@@direction_api_endpoint)
    params = {
      key: @key,
      origin: @source,
      destination: @destination
    }
    query = ""
    params.each do |k,v|
      query = query + "#{k}=#{v}&"
    end
    uri.query = query    
    response = Net::HTTP.get_response(uri)
    return response
  end


end