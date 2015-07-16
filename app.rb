require 'open-uri'
require "net/http"
require 'rest-client'
require 'json'
# require 'sinatra'
# require 'sinatra/contrib'
require 'rubygems'



z = RestClient::Request.execute(
 :method => :get,
 :url => "https://api.zomato.com/v1/restaurant.json/16512742",
 :headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
)
obj = JSON.parse(z)
puts obj["menu"]["0"]["page"]["url"]
# def get_city_list(obj)
# 	len = obj["results"].length
# 	for i in 0..len-1
# 				puts obj["results"][i]["result"]["name"]
#     		puts obj["results"][i]["result"]["id"]
# 	end
# end
# get_city_list(obj)