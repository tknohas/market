class Product < ApplicationRecord
  acts_as_list

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :position, presence: true, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }

  scope :default_order, -> { order(:position) }

  def published!
    update!(published_at: Time.current)
  end

  def unpublished!
    update!(published_at: nil)
  end
end
