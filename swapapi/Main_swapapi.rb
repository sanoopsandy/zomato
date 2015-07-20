require 'json'
require 'rest-client'
require './restaurant.rb'

class Main_swapapi

	def self.call_api(query, id) 
	x = RestClient::Request.execute(
    :method => :get,
    :url => "http://api.civicapps.org/"+query+id,
    )
    obj = JSON.parse(x)
    return obj
	end

	def self.update_rest(obj)
		rest_arr = Array.new
		obj["results"].each do |result|
		  name = result["name"]
		  id = result["inspection_number"]
		  temp = Restaurant.new(name, id)
		  rest_arr.push(temp)
		end
		return rest_arr
	end

	# def self.update_rest(obj)
	# 	obj.collect{|rest| Restaurant.new(rest)}
		
	# end


	def self.update_detail(rest_id)
		obj = call_api('restaurant-inspections/inspection/',rest_id.to_s)
    nam = obj["results"]["restaurant_name"]
    # puts nam
    detail = {"address" => obj["results"]["address"]["street"],
              "city" => obj["results"]["address"]["city"],
              "date" => obj["results"]["date"],
              "type" => obj["results"]["type"],
              "violations" => obj["results"]["violations"][0]["law"],
              "violation_rule" => obj["results"]["violations"][0]["violation_rule"]}
    temp = Restaurant.new(nam, rest_id, detail)
    return temp
    # puts temp.inspect
  end


	def self.list_rest()
  	obj = call_api('restaurant-inspections/','')
    update_rest(obj)
  end
end

