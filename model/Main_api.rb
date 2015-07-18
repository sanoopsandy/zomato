require 'rest-client'
require 'json'

# REVIEW -- class names & file name should match.
# REVIEW -- Fix naming conventions. Read https://github.com/bbatsov/ruby-style-guide#naming
class Main_api
	@@Main_api_end_point = "https://api.zomato.com/v1/"

	def self.call_api(query, id)
    x = RestClient::Request.execute(
      :method => :get,
      :url => @@Main_api_end_point+query+id,
      :headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
      )
    @obj = JSON.parse(x)
    return @obj
  end

  def self.list_states()
  	call_api("cities.json",'/')
  end

  def self.list_local(city_id)
  	call_api("subzones.json?city_id=",id = city_id.to_s)
  end

  def self.list_restaurant(local_id)
  	call_api("search.json?subzone_id=",id = local_id.to_s)
  end

  def self.list_detail(rest_id)
  	call_api("restaurant.json/",id = rest_id.to_s)
  end

end