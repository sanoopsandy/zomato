require 'net/http'
require 'json'
require 'uri'
require 'rest-client'


def call_api(query, id) 
x = RestClient::Request.execute(
  :method => :get,
  :url => "http://api.civicapps.org/"+query+id,
  )
  obj = JSON.parse(x)
  return obj
end
	
	obj = call_api('restaurant-inspections/inspection/','6609276')
	obj["results"].each do |result|
		name = obj["results"]["address"]
		puts name
	end

# a = call_api('restaurant-inspections/inspection/','6609276')
# puts a["results"]["address"]["street"]