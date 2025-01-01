class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :position, numericality: { only_integer: true, allow_nil:true, greater_than_or_equal_to: 0 }
end