class Restaurant

	attr_accessor :name, :id ,:menu_url ,:locality, :city, :avgcostfortwo, :display_rev, :timings, :url, :review  ,:image ,:address
	def initialize(name, id , menu_url, opts={})
		@name = name
    @id = id
    @menu_url = menu_url
    opts.each_pair do |k ,v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
    end
  end
end
