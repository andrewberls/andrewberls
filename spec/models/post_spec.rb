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

  context "post with pagebreak" do
    BREAK_TAG = '<break />'

    before do
      @post = FactoryGirl.build(:post_with_pagebreak)
    end

    it "has a valid factory" do
      @post.should be_valid
    end

    it "should render the teaser correctly" do
      @post.teaser.should == "<p>This is before the break.</p>"
    end

    it "should render the full post without a break tag" do
      @post.full_text.should_not include BREAK_TAG
    end
  end

  context "url aliases" do
    before do
      @post = FactoryGirl.build(:post)
    end

    it "should lowercase all urls" do
      @post.url_alias = "TEST"
      @post.url_alias.should == "test"
    end

    it "should strip trailing whitespace" do
      @post.url_alias = "  test  \t"
      @post.url_alias.should == "test"
    end

    it "should chomp the alias" do
      @post.url_alias = "test\r\n"
      @post.url_alias.should == "test"
    end

    it "should replace spaces with hyphens correctly" do
      @post.url_alias = "this  is the title"
      @post.url_alias.should == "this-is-the-title"
    end

    it "should not replace numbers" do
      @post.url_alias = "1234-ways-to-be-cool"
      @post.url_alias.should == "1234-ways-to-be-cool"
    end

    it "should handle malformed urls correctly" do
      @post.url_alias = "This is   the  !   \t TITLE@\#$%^&*("
      @post.url_alias.should == "this-is-the-title"
    end

    it "should not change correct urls" do
      @post.url_alias = "this-is-the-title"
      @post.url_alias.should == "this-is-the-title"
    end

    it "should handle completely average use cases" do
      @post.url_alias = "Suggesting URL aliases with Coffeescript"
      @post.url_alias.should == "suggesting-url-aliases-with-coffeescript"
    end
  end

end
