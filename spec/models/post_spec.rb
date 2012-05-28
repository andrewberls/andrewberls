require 'spec_helper'

describe Post do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end

  it "is invalid without a body" do
    FactoryGirl.build(:post, body: nil).should_not be_valid
  end

  context "url alias" do
    it "should be valid without a url alias" do
      FactoryGirl.build(:post, url_alias: "").should be_valid
    end

    it "should be valid with a url alias" do
      FactoryGirl.build(:post, url_alias: "test-alias").should be_valid
    end
  end

end