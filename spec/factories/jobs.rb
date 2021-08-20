FactoryBot.define do
  factory :job do
    title { "MyString" }
    description { "MyText" }
    category { "MyString" }
    deadline { 1.days.ago }
    user { nil }
  end
end
