FactoryGirl.define do
  sequence(:username) { |n| "John#{n}" }
  sequence(:email) { |n| "email#{n}@example.com" }

  factory :user do
    username
    email
    password 'qwerqwer'
  end
end