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
    assert_equal last_response.status,200
  end

  def test_app_post
    post '/'
    assert_equal last_response.status,302
    assert last_response.body.include?("welcome")
  end
end
