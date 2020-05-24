FactoryBot.define do
  factory :schedule do
    title { "MyString" }
    content { "MyText" }
    start_date { "2020-05-24 07:20:11" }
    user { nil }
  end
end
