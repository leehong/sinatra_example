#myapp.rb 
require 'sinatra'
require 'haml'

set(:probability) { |value| condition { rand <= value } }

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

set :foo, 'bar'
set :baz, Proc.new{"Hello " + foo}

get '/baz' do
	"baz is set to " + settings.baz
end

get '/' do
	haml '%h1 Hello World'
end

not_found do 
	'this is nowhere to be found'
end
