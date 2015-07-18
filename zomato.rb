require 'sinatra'
require 'sinatra/contrib'
require './model.rb'
require './controller/get_list.rb'
set :server, 'webrick'

get '/'  do
  # REVIEW -- why are @var variable being used here? Are these attributes of
  # an objects? Which object?
	@state_obj = Main_api.list_states
	@list_var = Get_list.get_city_list(@state_obj)
	erb :index, :locals => {'list_var' => @list_var}	
end

get '/state/:id' do
  @city_id = params[:id]
  @local_obj = Main_api.list_local(@city_id)
  @local_var = Get_list.get_local_list(@local_obj)
	erb :state_fix, :locals => {'local_var' => @local_var}
end

get '/state/restaurant/:id' do
	@locality_id = params[:id]
  @rest_obj = Main_api.list_restaurant(@locality_id)
  @rest_var = Get_list.get_restaurant_list(@rest_obj)
	erb :restaurant, :locals => {'rest_var' => @rest_var}
end

get '/state/restaurant/details/:id' do
	@rest_id = params[:id]
	@restaurant_obj = Main_api.list_detail(@rest_id)
	erb :details, :locals => {'restaurant_var' => @restaurant_obj}
end

not_found do
  status 404
  'Sorry page not found'
end
