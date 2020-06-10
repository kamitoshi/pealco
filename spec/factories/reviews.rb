FactoryBot.define do
  factory :review do
    rating {3}
    content { "MyText" }
    association :user, factory: :user
    association :post
  end
end