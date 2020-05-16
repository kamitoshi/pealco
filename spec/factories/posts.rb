FactoryBot.define do
  factory :post do
    title { "MyString" }
    menu_name { "MyString" }
    content { "MyText" }
    image { "MyString" }
    user { nil }
    alc_category { nil }
    menu_category { nil }
  end
end
