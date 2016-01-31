require "rails_helper"

describe Article do
  it "has a valid factory" do
    FactoryGirl.create(:article).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:article, title: nil).should_not be_valid
  end

  it "is invalid without a text" do
    FactoryGirl.build(:article, text: nil).should_not be_valid
  end

  it "does not allow duplicate title" do
    article = FactoryGirl(:article)
    FactoryGirl(title: "productname")
    FactoryGirl.build(title: "productname").should_not be_valid
  end
end