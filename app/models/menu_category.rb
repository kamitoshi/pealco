class MenuCategory < ApplicationRecord
  has_many :post, dependent: :nullify
end
