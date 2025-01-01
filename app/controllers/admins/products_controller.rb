class Admins::ProductsController < Admins::ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: '登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.expect(product: %i[name price description position description published_at])
  end
end