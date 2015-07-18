require 'open-uri'
require "net/http"
require 'rest-client'
require 'json'
# require 'sinatra'
# require 'sinatra/contrib'
require 'rubygems'



x = RestClient::Request.execute(
:method => :get,
:url => "https://api.zomato.com/v1/restaurant.json/16518092",
:headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
)
obj = JSON.parse(x)

puts obj["location"]["address"]
puts obj["location"]["city"]
# def get_city_list(obj)
#   @temp = []
#   @id = []
#   for i in 0..24
#     if obj["cities"][i]["city"]["country_id"] == 1
#       @temp.push(obj["cities"][i]["city"]["name"])
#       @id.push(obj["cities"][i]["city"]["id"])
#     end
#   end
# end
# get_city_list(obj)
# puts @temp
# puts obj
# 	def get_local_list(obj)
# 	  @len = obj["subzones"].length
# 	  @local = []
# 	  @subzone_id = []
# 	  obj["subzones"].each do |subzone|
# 	  	# puts subzone['subzone']
# 	    @local.push(subzone['subzone']["name"])
# 	    @subzone_id.push(subzone['subzone']["subzone_id"])
# 	  end
# 	  # return [@local,@subzone_id]
# 	end
# get_local_list(obj)
# puts @local

# def get_restaurant_list(obj)
# 		  @len = obj["results"].length
# 		  @names = []
# 		  @id = []
# 	  	obj["results"].each do |result|
# 		    @names.push(result['result']["name"])
# 		    @id.push(result['result']["id"])
# 		  end
# 		end
# get_restaurant_list(obj)
# puts @names