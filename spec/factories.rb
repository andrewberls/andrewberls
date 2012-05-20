FactoryGirl.define do

  factory :post do
    sequence(:title) { |i| "post#{i}" }
    body "this is the start <break /> this is after the break"
    status 1
    url_alias "test-post"
    association :user

    # factory :draft do
    #   status 1
    # end
  end

  factory :user do
    sequence(:email) { |i| "user#{i}@email.com" }
    sequence(:full_name) { |i| "user#{i}" }
    password "password"
    permissions 0
  end

end