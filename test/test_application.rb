require './test/helper'
OUTER_APP = Rack::Builder.parse_file('config.ru').first

class AppTest < Test::Unit:: TestCase
  include Rack::Test::Methods

  def app
    OUTER_APP
   # Sinatra::Application
  end

  def setup
    Article.destroy
  end 

  def test_app_default
    Article.insert(:title => "test",:content=>"test app",:date => Time.new)
    get '/posts'
    assert last_response.ok?
  end

  def test_app_post
    post '/posts', {:title =>"test", :content => "test content"}
    assert_equal 201, last_response.status
  end

  def test_app_put
    Article.insert(:title => "test",:content=>"test app",:date => Time.new)
    put "/posts/#{Article[:title=>'test'][:id]}",{:title => "test sinatra", :content => "test app put", :date => "2012-11-19 11:59:41 +0800"}
    assert_equal 200, last_response.status
  end

  def test_app_delete
    Article.insert(:title => "test",:content=>"test delete",:date => Time.new)
    delete "/posts/#{Article[:title=>'test'][:id]}"
    assert_equal 204,last_response.status
  end
end
