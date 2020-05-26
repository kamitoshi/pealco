require 'faker'
require 'forgery_ja'

FactoryBot.define do
  factory :user, class: User do
    name { ForgeryJa(:name).full_name }
    email { ForgeryJa('email').address }
    password { "password1" }
    password_confirmation { "password1" }
    introduction {"説明文"}
    association :alc_category
  end
end
FactoryBot.define do
  factory :other_user, class: User do
    name { ForgeryJa(:name).full_name }
    email { ForgeryJa('email').address }
    password { "password2" }
    password_confirmation { "password2" }
    introduction {"説明文"}
    association :alc_category
  end
end
