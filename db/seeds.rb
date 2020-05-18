# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# alc_category #

AlcCategory.create!(
  [
    {name:"ビール", image: File.open("#{Rails.root}/public/alc/beer.jpg")},
    {name:"ハイボール", image: File.open("#{Rails.root}/public/alc/highboll.jpg")},
    {name:"レモンサワー", image: File.open("#{Rails.root}/public/alc/lemon.jpg")},
    {name:"日本酒", image: File.open("#{Rails.root}/public/alc/japan.jpg")},
    {name:"焼酎", image: File.open("#{Rails.root}/public/alc/shochu.jpeg")},
    {name:"ワイン", image: File.open("#{Rails.root}/public/alc/wine.jpg")},
    {name:"スパークリングワイン", image: File.open("#{Rails.root}/public/alc/speakringWine.jpg")},
    {name:"カクテル", image: File.open("#{Rails.root}/public/alc/kakuteru.jpg")},
    {name:"その他", image: File.open("#{Rails.root}/public/alc/other.jpg")}
  ]
)

# MenuCategory #

MenuCategory.create!(
  [
    {name:"定番"},{name:"ユニーク"},{name:"簡単"},
    {name:"自作"},{name:"おすすめ"}
  ]
)

# users #
5.times do |n|
  User.create!(
    name: "test#{n + 1}",
    email: "test#{n + 1}@mail.com",
    password: "test#{(n+1).to_s+(n+1).to_s}",
    password_confirmation: "test#{(n+1).to_s+(n+1).to_s}",
    # image: open("#{Rails.root}/app/assets/images/users/no_image.png"),
    alc_category_id: n+1
  )
end
