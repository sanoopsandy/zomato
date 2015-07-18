require 'rest-client'
require 'json'
require './class/city.rb'
require './class/locality.rb'
require './class/restaurant.rb'
require './class/details.rb'

class Main_api
	@@Main_api_end_point = "https://api.zomato.com/v1/"

	def self.call_api(query, id)
    x = RestClient::Request.execute(
    :method => :get,
    :url => @@Main_api_end_point+query+id,
    :headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
    )
    obj = JSON.parse(x)
    return obj
  end

  def self.update_city(city_obj)
    city_arr = Array.new
    city_obj["cities"].map do |city|
      if city['city']["country_id"] == 1
        name = city['city']["name"]
        id = city['city']["id"]
        temp = City.new(name, id)
        city_arr.push(temp)
      end
    end
    return city_arr
  end 

  def self.update_locality(local_obj)
    locality = Array.new
    local_obj["subzones"].map do |subzone|
      name = subzone['subzone']["name"]
      id = subzone['subzone']["subzone_id"]
      temp = Locality.new(name, id)
      locality.push(temp)
    end
    return locality
  end 

  def self.update_restaurant(rest_obj)
    restaurant = Array.new
    rest_obj["results"].map do |result|
      name = result['result']["name"]
      id = result['result']["id"]
      temp = Restaurant.new(name, id,'')
      restaurant.push(temp)
    end
    return restaurant
  end 


  def self.list_city()
  	city_obj = call_api("cities.json",'/')
    update_city(city_obj)
  end

  def self.list_local(city_id)
  	local_obj = call_api("subzones.json?city_id=",id = city_id.to_s)
    update_locality(local_obj)
  end

  def self.list_restaurant(local_id)
  	rest_obj = call_api("search.json?subzone_id=",id = local_id.to_s)
    update_restaurant(rest_obj)
  end


  def self.list_detail(rest_id)
  	det_obj = call_api("restaurant.json/",id = rest_id.to_s)
    nam = det_obj["name"]
    menu_url = det_obj["menu"]["0"]["page"]["url"]
    detail = {"address" => det_obj["location"]["address"],
              "locality" => det_obj["location"]["locality"],
              "city" => det_obj["location"]["city"],
              "avgcost" => det_obj["avgCostForTwo"],
              "timings" => det_obj["timings"],
              "url" => det_obj["url"],
              "image" => det_obj["image_470_310"],
              "review" => det_obj["userReviews"]["0"],
              "display_rev" => det_obj["userReviews"]["0"]["review"]["reviewText"]}

    temp = Restaurant.new(nam, rest_id, menu_url, detail)
    return temp
  end
end