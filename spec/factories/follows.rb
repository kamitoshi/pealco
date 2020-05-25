FactoryBot.define do
  factory :follow do
    association :user, factory: :user
    association :follow, factory: :other_user
  end
end
