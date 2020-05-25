FactoryBot.define do
  factory :like do
    association :user, factory: :user
    association :post
  end
end
