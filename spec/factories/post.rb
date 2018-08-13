FactoryBot.define do

  factory :post do
    sequence(:title) { |i| "post #{i}" }
    sequence(:body) { |i| "this is post #{i}" }
    sequence(:url_alias) { |i| "post-#{i}" }
    status 1
    association :user
    # association :tag

    # after(:build) do |post|
    #   post.tags << FactoryBot.build(:tag, name: "alpha")
    # end

    factory :post_with_pagebreak do
      body "<p>This is before the break.</p> <break /> <p>This is after the break.</p>"
    end
  end

end
