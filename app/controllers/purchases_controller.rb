class PurchasesController < ApplicationController
  def new
  end

  def create
    @purchase = current_user.purchases.build
    if @purchase.complete!
      current_cart.clear
      redirect_to products_path, notice: '商品を購入しました'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
