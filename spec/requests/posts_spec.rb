require 'spec_helper'
require 'factories'

describe "Posts" do

  describe "create" do

    it "validates title" do
      post = FactoryGirl.create(:post)
      visit root_url
      click_link "Blog"
      assert_equal blog_path, current_path
    end

  end

end
