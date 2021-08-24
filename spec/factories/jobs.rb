FactoryBot.define do
  factory :job do
    title { "Title of job" }
    description { "Description about job" }
    category { "IT Security" }
    deadline { "2022-08-21 18:21:53" }
    user { nil }
  end
end
