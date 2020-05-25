FactoryBot.define do
  factory :post do
    title { "餃子" }
    menu_name { "餃子" }
    content { "美味しいですよね" }
    association :user, factory: :user
    association :alc_category
    association :menu_category
  end
end
