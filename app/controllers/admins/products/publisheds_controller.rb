class Admins::Products::PublishedsController < Admins::ApplicationController
  before_action :set_product, only: %i[create destroy]

  def create
    @product.published!
    redirect_to admins_product_path(@product), notice: '商品を公開しました'
  end

  def destroy
    @product.unpublished!
    redirect_to admins_product_path(@product), notice: '商品を非公開にしました'
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
