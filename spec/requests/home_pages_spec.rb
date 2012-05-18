require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Hello!'" do
      visit '/'
      page.should have_content('Hello!')
    end

    it "should have the right title" do
      visit '/'
      page.should have_selector('title', text: "Andrew Berls")
    end
  end

  describe "" do
    it "Should have the correct title" do
      visit '/not-found'
      page.should have_selector('title', text: "Andrew Berls | Not Found")
    end

    it "should have the correct content" do
      visit '/not-found'
      page.should have_content('Oh no!')
    end
  end

end
