class Main_api
  Main_api_end_point = "http://api.civicapps.org/"
  def self.call_api(query, id)
    x = RestClient::Request.execute(
    :method => :get,
    :url => @@Main_api_end_point+query+id,
    :headers => {"X-Zomato-API-Key" => "7749b19667964b87a3efc739e254ada2"}
    )
    obj = JSON.parse(x)
    return obj
  end

  def self.list_city()
    city_obj = call_api("cities.json",'/')
    update_city(city_obj)
  end