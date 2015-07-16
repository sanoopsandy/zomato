# var = curl --header "X-Zomato-API-Key:7749b19667964b87a3efc739e254ada2" "https://api.zomato.com/v1/search.json?city_id=1"
require 'rubygems'
require 'json'
require 'rest-client' 
 
	# X-Zomato-API-Key:7749b19667964b87a3efc739e254ada2
require 'rest-client'
	x = RestClient::Request.execute(
 :method => :get,
 :url => "https://api.zomato.com/v1/cities.json",
 :headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
	)
	obj = JSON.parse(x)
	
def get_city_list(obj)
	country_id = 1
	@temp = []
	@id = []
	for i in 0..24
		if obj["cities"][i]["city"]["country_id"] == country_id
				@temp.push(obj["cities"][i]["city"]["name"])
				@id.push(obj["cities"][i]["city"]["id"])
		end
	end
end
get_city_list(obj)