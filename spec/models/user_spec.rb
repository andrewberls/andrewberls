require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a full name" do
    FactoryGirl.build(:user, full_name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "should not allow duplicate emails" do
    FactoryGirl.create(:user, email: "used@email.com")
    FactoryGirl.build(:user, email: "used@email.com").should_not be_valid
  end
end