#app for sinatra method
require 'sinatra'
require 'haml'
require 'erb'
require 'sinatra/reloader'
require 'sequel'

set :views, File.dirname(__FILE__) + '/views'
set :foo, 'bar'
set :baz, Proc.new{"Hello " + foo}

def auto_reload_ignores
    [/db.*/, /config.yaml/, /log.*/, /tmp.*/]
end

set(:probability) { |value| condition { rand <= value } }

DB= Sequel.connect('mysql2://root:admaster@localhost:3360/item')

get '/win_a_car', :probability => 0.1 do
  "You won!"
end

get '/win_a_car' do
  "Sorry, you lost."
end

get '/hello/:name' do 
	#'hello #{params[:name]}'
	"Hello #{params[:name]}!"
end 

get '/baz' do
	"baz is set to " + settings.baz
end

get '/hello' do
	haml '%h1 Hello World'
end

get '/post' do
 erb :post 
end

not_found do 
	'this is nowhere to be found'
end

post '/' do
  haml "%h1 hello,#{params[:user]}"
end

get '/find' do
   @item=DB.dataset.from('items')
   haml @item
end
