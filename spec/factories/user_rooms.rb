FactoryBot.define do
  factory :user_room do
    association :user, factory: :user
    association :room
  end
end
