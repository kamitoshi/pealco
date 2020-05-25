FactoryBot.define do
  factory :message do
    content { "コメントコメントコメントコメントコメントコメント" }
    association :user, factory: :user
    association :room
  end
end
