require 'sinatra'
require 'sinatra/contrib'
require 'json'
require 'rubygems'
require 'open-uri'


get '/' do
	erb :index
end

get '/ui' do
	erb :ui
end

get '/test' do
	erb :test
end

get '/state/:id' do
  @city_id = params[:id]
  erb :state, :locals  => {'city_id' => @city_id}
end

get '/state/restaurant/:id' do
	@subzone_id = params[:id]
	erb :restaurant, :locals => {'subzone_id' => @subzone_id}
end

get '/state/restaurant/details/:id' do 
	@rest_id = params[:id]
	erb :details, :locals => {'rest_id' => @rest_id}
end

not_found do
  status 404
  'Sorry page not found'
end
