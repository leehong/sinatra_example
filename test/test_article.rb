require './test/helper'
class TestArticle < Test::Unit::TestCase
  def setup
    Article.destroy
  end

  def test_add_article
    Article.insert(:title => "hello",:content => "hello sinatra",:date => Time.new)
    assert_equal 'hello', Article[:title => "hello"].title
  end

end
