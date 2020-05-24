class Schedule < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :content, length:{maximum:400}
end
