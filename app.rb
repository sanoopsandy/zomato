require 'open-uri'
require "net/http"
require 'rest-client'
require 'json'
# require 'sinatra'
# require 'sinatra/contrib'
require 'rubygems'



x = RestClient::Request.execute(
 :method => :get,
 :url => "https://api.zomato.com/v1/subzones.json?city_id=13",
 :headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
)
obj = JSON.parse(x)
def get_city_list(obj)
	len = obj["subzones"].length
	for i in 0..len-1
				puts obj["subzones"][i]["subzone"]["name"]
	end
end
get_city_list(obj)