FactoryGirl.define do
  factory :user do
    full_name "Test User"
    sequence(:email) { |i| "user#{i}@email.com" }
    password "password"
  end
end