class Post < ApplicationRecord
  belongs_to :user
  belongs_to :alc_category
  belongs_to :menu_category
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :review, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :menu_name, presence: true
  validates :content, presence: true, length:{maximum:400}
  validates :user_id, presence: true
  validates :alc_category_id, presence: true
  validates :menu_category_id, presence: true

end
