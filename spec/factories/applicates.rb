FactoryBot.define do
  factory :applicate do
    first_name { "MyString" }
    last_name { "MyString" }
    birthdate { "2021-08-21 18:35:31" }
    email { "example@example.com" }
    phone { "+444-444-444" }
    address { "MyString" }
    education { "MyString" }
    job { nil }
  end
end
