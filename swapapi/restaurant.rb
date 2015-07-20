class Restaurant

	attr_accessor :name, :id , :address, :locality, :city, :date, :type, :violations ,:violation_rule
	def initialize(name, id , opts={})
		@name = name
    @id = id
    opts.each_pair do |k ,v|
      self.send("#{k}=",v) if self.respond_to?("#{k}=")
    end
  end
end
