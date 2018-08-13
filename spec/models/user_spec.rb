# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  full_name     :string(255)
#  permissions   :integer
#

require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it 'is invalid without a full name' do
    expect(FactoryBot.build(:user, full_name: nil)).to_not be_valid
  end

  it 'is invalid without an email' do
    expect(FactoryBot.build(:user, email: nil)).to_not be_valid
  end

  it 'should not allow duplicate emails' do
    FactoryBot.create(:user, email: 'used@email.com')
    expect(FactoryBot.build(:user, email: 'used@email.com')).to_not be_valid
  end
end
