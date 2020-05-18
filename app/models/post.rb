class Post < ApplicationRecord
  belongs_to :user
  belongs_to :alc_category
  belongs_to :menu_category

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :menu_name, presence: true
  validates :content, presence: true, length:{maximum:400}
  validates :image, presence: true

  
end
