require 'net/http'
require 'uri'

class TranslinkURI
  attr_accessor :api_key
  attr_reader :query

  def initialize(api_key)
    @api_key = api_key
    @host = "api.translink.ca"
    @query = {}
  end

  def add_query(hash={})
    @query.merge!(hash)
  end

  def delete_query(*query_array)
    query_array.each do |query|
      @query.delete(query) {|query| "#{query} not found"}
    end
  end

  def edit_query(hash={})
    
  end

  def full_uri
    uri = "http://" + @host + "/RTTIAPI/V1/stops/"
    queries = "?" 
  end

  def to_s
    puts "Nothing to see here, move along"
  end
end

#translink_query = URI::HTTP.build(host: "api.translink.ca", 
#                                  path: "/RTTIAPI/V1/stops", 
#                                  query: {"apiKey" => "qrCMsNVvEK51jXynvdQg", 
#                                          "lat" => 49.187706, 
#                                          "long" => -122.850060, 
#                                          "content-type" => "application/JSON"})
