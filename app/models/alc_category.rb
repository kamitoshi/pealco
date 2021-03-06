class AlcCategory < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :posts, dependent: :nullify

  mount_uploader :image, ImageUploader
end
