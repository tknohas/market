class Products::CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[update destroy]

  def create
    product = Product.find(params[:product_id])
    cart_item = current_cart.cart_items.build(product_id: product.id, quantity: cart_item_params[:quantity].to_i)
    if cart_item.save
      redirect_to products_path, notice: 'カートに追加しました'
    else
      redirect_to product_path(product), status: :unprocessable_entity
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: '更新しました'
    else
      redirect_to cart_path, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item.destroy!
    redirect_to cart_path, notice: '削除しました'
  end

  private

  def cart_item_params
    params.expect(cart_item: %i[quantity])
  end

  def set_cart_item
    @cart_item = current_cart.cart_items.find(params[:id])
  end
end
