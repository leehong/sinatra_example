ENV['RACK_ENV'] = 'test'
require 'test/unit'
require 'rack/test'

OUTER_APP = Rack::Builder.parse_file('config.ru').first

class AppTest < Test::Unit:: TestCase
  include Rack::Test::Methods

  def app
    OUTER_APP
   # Sinatra::Application
  end

  def test_app_default
   get '/'
   assert last_response.ok?
  end

  def test_app_add
    get '/add'
  end
end
