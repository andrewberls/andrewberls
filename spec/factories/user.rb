FactoryBot.define do

  factory :user do
    full_name "Test User"
    sequence(:email) { |i| "user#{i}@email.com" }
    password "password"

    factory :user_with_post do
      after(:build) do |user|
        user.posts << FactoryBot.build(:post, user: user)
      end
    end
  end

end
