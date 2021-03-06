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
    get '/posts'
    assert last_response.ok?
  end

  def test_app_post
    post '/posts', {:title =>"test", :content => "test content"}
    assert_equal 201, last_response.status
  end

  def test_app_put
    put '/posts/1',{:title => "hello sinatra", :content => "sdsadsad", :date => "2012-11-19 11:59:41 +0800"}
    assert_equal 200, last_response.status
  end

  def test_app_delete
    delete '/posts/30'
    assert_equal 204,last_response.status
  end
end
