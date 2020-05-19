class User < ApplicationRecord
  belongs_to :alc_category, optional: true
  has_many :posts, dependent: :destroy
  has_many :user_rooms, dependent: :nullify
  has_many :rooms, through: :user_rooms
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length:{maximum:20}
  mount_uploader :image, ImageUploader
end
