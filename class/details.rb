class Details

	attr_accessor :name,:address, :locality, :city, :avgcostfortwo, :timings, :url, :review ,:menu

  def initialize(name, address ,locality ,city ,avgcostfortwo ,timings ,url ,review ,menu)
    @name = name
    @address = address
    @locality = locality
    @city = city
    @avgcostfortwo = avgcostfortwo
    @timings = timings
    @url = url
    @review = review
    @menu = menu
  end
end