FactoryBot.define do
  factory :user do
    first_name { "Example" }
    last_name { "Example" }
    email { "example@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
