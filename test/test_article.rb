require 'test/unit'
require 'rack/test'
require 'sequel'
require './models/article.rb'

class TestArticle < Test::Unit::TestCase
  def setup
    @articles = Article.all
  end

  def test_status_initialized
    assert_equal @articles.size, 1
  end
end
