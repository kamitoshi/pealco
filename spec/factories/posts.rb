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
FactoryBot.define do
  factory :other_post do
    title { "唐揚げ" }
    menu_name { "唐揚げ" }
    content { "美味しいですよね" }
    association :other_user, factory: :other_user
    association :alc_category
    association :menu_category
  end
end