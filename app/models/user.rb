class User < ApplicationRecord
  belongs_to :alc_category, optional: true
  has_many :posts, dependent: :destroy
  has_many :user_rooms, dependent: :nullify
  has_many :rooms, through: :user_rooms
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :schedules, dependent: :destroy
  # followリレーション
  has_many :follows, dependent: :destroy
  has_many :follow_users, through: :follows, source: :follow
  has_many :followed, class_name: "Follow", foreign_key: "follow_id"
  has_many :followed_users, through: :followed, source: :user

  # roomリレーション
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms

  # messageリレーション
  has_many :messages, dependent: :nullify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length:{maximum:20}
  validates :introduction, length:{maximum:400}
  mount_uploader :image, ImageUploader

  # 引数で渡されたユーザーをフォローする
  def follow(user)
    unless self == user
      self.follows.find_or_create_by(follow_id: user.id)
    end
  end

  # 引数で渡されたユーザーのフォローを解除する
  def unfollow(user)
    follow = self.follows.find_by(follow_id: user.id)
    follow.destroy if follow
  end

  # 引数で渡されたユーザーをフォローしているかを判別する
  def follow?(user)
    self.follow_users.include?(user)
  end

  # 引数により渡されたRoomに紐づく中間テーブル作成メソッド
  def user_room(room)
    self.user_rooms.find_or_create_by(room_id: room.id)
  end

end
