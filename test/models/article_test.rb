require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "article not save without title" do
    article = Article.new(:title => nil, :text => "basic text")
    assert_not article.save,"article not save without title"
  end

  test "article not save without text" do
    article = Article.new(:text => nil, :title => "basic text")
    assert_not article.save,"article not save without text"
  end

  test "article create successfully" do
    article = Article.new(:title=> "articlettest", :text=> "basic text")
    assert article.save, "article create successfully"
  end
end
