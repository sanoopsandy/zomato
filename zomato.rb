require 'sinatra'
require 'sinatra/contrib'
require './Main_api.rb'
set :server, 'webrick'

get '/'  do
  # REVIEW -- why are @var variable being used here? Are these attributes of
  # an objects? Which object? -------- ------------------------------------------------- #fixed
	city = Main_api.list_city
 	erb :index, :locals => {'city' => city}	
end

get '/city/:id' do
  city_id = params[:id]
  local = Main_api.list_local(city_id)
	erb :state_fix, :locals => {'local' => local}
end

get '/city/restaurant/:id' do
	locality_id = params[:id]
  rest = Main_api.list_restaurant(locality_id)
	erb :restaurant, :locals => {'rest' => rest}
end

get '/city/restaurant/details/:id' do
	rest_id = params[:id]
	restaurant_obj = Main_api.list_detail(rest_id)
	# puts restaurant_obj.avgcostfortwo
	erb :details, :locals => {'restaurant_obj' => restaurant_obj}
end

not_found do
  status 404
  'Sorry page not found'
end
