class Post < ApplicationRecord
  belongs_to :user
  belongs_to :alc_category
  belongs_to :menu_category

  validates :title, presence: true
  validates :menu_name, presence: true
  validates :content, presence: true, length:{max:400}
  validates :image, presence: true
end