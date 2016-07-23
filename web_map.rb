require 'sinatra'
require 'net/http'
require 'json'
require 'sinatra/jsonp'

#helpers do
  def bus_query # plus optional contraint arguments
    uri = URI.parse("http://api.translink.ca/rttiapi/v1/buses?apikey=qrCMsNVvEK51jXynvdQg")
  
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    # set accept and content-type to application/JSON
    request.[]=('accept', 'application/JSON')
    request.content_type = 'application/JSON'

    response = http.request(request)

    #format JSON into usable hash
    bus_hash = response.body
    bus_hash.delete! '\\'
    bus_hash.delete! '\\'
    bus_hash = JSON.parse(bus_hash)

    return bus_hash
  end

  def stop_query # plus optional constraint arguments
    uri = URI.parse("http://api.translink.ca/rttiapi/v1/buses?apikey=qrCMsNVvEK51jXynvdQg")
  
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)

    # set accept and content-type to application/JSON
    request.[]=('accept', 'application/JSON')
    request.content_type = 'application/JSON'

    response = http.request(request)

    # yada yada for now
  end
#end

get '/' do
  erb :index
end

get '/bus' do
  #@bus_hash = bus_query()
  #erb :index
  JSONP bus_query()
end

get '/stop' do
  @stop_hash = stop_query()
  erb :index
end
