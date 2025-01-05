class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [100, 100], preprocessed: true
    attachable.variant :large, resize_to_limit: [300, 300], preprocessed: true
  end
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  acts_as_list

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :position, presence: true, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }

  scope :default_order, -> { order(:position) }
  scope :published, -> { where.not(published_at: nil) }

  def published!
    update!(published_at: Time.current)
  end

  def unpublished!
    update!(published_at: nil)
  end
end
