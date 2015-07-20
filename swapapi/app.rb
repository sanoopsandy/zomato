require 'sinatra'
require 'sinatra/contrib'
require './Main_swapapi.rb'
set :server, 'webrick'


get '/'  do
	restaurant = Main_swapapi.list_rest
 	erb :index, :locals => {'restaurant' => restaurant}	
end


get '/restaurant/:id'  do
	rest_id = params[:id]
	details = Main_swapapi.update_detail(rest_id)
	# puts details.name
 	erb :details, :locals => {'details' => details}	
end

# get '/city/:id' do
#   city_id = params[:id]
#   local = Main_api.list_local(city_id)
# 	erb :state_fix, :locals => {'local' => local}
# end