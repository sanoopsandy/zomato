
class Get_list
	def self.get_city_list(obj)
	  @temp = []
	  @id = []
	  # REVIEW -- Read about Ruby iterators. Use them. Use filter & collect over here.
	  obj["cities"].each do |city|
	    if city['city']["country_id"] == 1
	      @temp.push(city['city']["name"])
	      @id.push(city['city']["id"])
	    end
	  end
	  return [@temp,@id]
	end

	def self.get_local_list(obj)
	  @local = []
	  @subzone_id = []
	  obj["subzones"].each do |subzone|
	    @local.push(subzone['subzone']["name"])
	    @subzone_id.push(subzone['subzone']["subzone_id"])
	  end
	  return [@local,@subzone_id]
	end

	def self.get_restaurant_list(obj)
		  @names = []
		  @id = []
	  	obj["results"].each do |result|
		    @names.push(result['result']["name"])
		    @id.push(result['result']["id"])
		  end
		return [@names,@id] 
	end
end