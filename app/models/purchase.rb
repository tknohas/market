class Purchase < ApplicationRecord
  belongs_to :user
  has_many :purchase_items, dependent: :destroy
  has_many :products, through: :purchase_items

  before_create :set_financial_attributes

  def complete!
    transaction do
      user.cart.cart_items.each do |cart_item|
        purchase_items.build(
          product_id: cart_item.product_id,
          name: cart_item.product.name,
          price: cart_item.product.price,
          quantity: cart_item.quantity
        )
      end
      save!
    end
  end

  private

  def set_financial_attributes
    assign_attributes(
      subtotal: user.cart.subtotal,
      shipping_fee: user.cart.calculate_shipping_fee,
      delivery_fee: user.cart.cash_on_delivery_fee,
      tax: user.cart.tax_price,
      tax_rate: Cart::TAX_RATE,
      total_price: user.cart.total_price
    )
  end
end
