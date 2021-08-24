FactoryBot.define do
  factory :user do
    first_name { "Example" }
    last_name { "Example" }
    sequence(:email) { |n| "john#{n}@live.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
