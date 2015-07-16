require 'sinatra'
require 'sinatra/contrib'
require 'json'
require 'rubygems'
require 'open-uri'


get '/' do
	erb :index
end

get '/test' do
	erb :test
end

get '/state/:id' do
  @city_id = params[:id]
  erb :state, :locals  => {'city_id' => @city_id}
end

not_found do
  status 404
  'Sorry page not found'
end
