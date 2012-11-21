ENV["RACK_ENV"] = 'test'
require 'test/unit'
require 'rack/test'
require 'sequel'
require './config/boot'
require './models/article'

class TestArticle < Test::Unit::TestCase
  def setup
    Article.destroy
  end

  def test_add_article
    Article.insert(:title => "hello",:content => "hello sinatra",:date => Time.new)
    assert_equal 'hello', Article[:title => "hello"].title
  end

end
