require 'faker'
require 'forgery_ja'

FactoryBot.define do
  factory :schedule do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    start_date { "2020-05-24 07:20:11" }
    association :user, factory: :user
  end
end
