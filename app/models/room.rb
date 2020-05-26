class Room < ApplicationRecord
  # roomリレーション
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms

  # messageリレーション
  has_many :messages, dependent: :destroy

end
