require "rails_helper"

describe Article do
  it "is invalid without a title" do
     article = Article.new(title: nil)
     article.valid?
     expect(article.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a text" do
    article = Article.new(text: nil)
    article.valid?
    expect(article.errors[:text]).to include("can't be blank")
  end

  it "is valid with title,text" do
    article = Article.new(:title =>"test",:text=> "test_text")
    expect(article).to be_valid
  end

end
