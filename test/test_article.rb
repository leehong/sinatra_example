require 'test/unit'
require 'rack/test'
require 'sequel'
require './models/article.rb'

class TestArticle < Test::Unit::TestCase
  def setup
    @articles = Article.all
  end

  def test_add_article
    Article.insert(:title => "hello",:content => "hello sinatra",:date => Time.new)
    assert_equal 'hello', Article[:title => "hello"].title
  end

end
