FactoryGirl.define do
  
  factory :post do
    sequence(:title) { |i| "post #{i}" }
    sequence(:body) { |i| "this is post #{i}" }
    sequence(:url_alias) { |i| "post-#{i}" }
    status 1

    association :user
  end

end