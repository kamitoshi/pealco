FactoryBot.define do
  factory :comment do
    content { "MyText" }
    association :user, factory: :user
    association :post
  end
end
