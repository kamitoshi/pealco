class User < ApplicationRecord
  belongs_to :alc_category
  has_many :posts, dependent: :destroy
  has_many :user_rooms, dependent: :nullify
  has_many :rooms, through: :user_rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end