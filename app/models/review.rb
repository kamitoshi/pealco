class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :rating, presence: true, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}
  validates :content, length:{maximum:400}
end
