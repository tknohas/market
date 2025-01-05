class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.default_order.published
  end

  def show
    @product = Product.published.find(params[:id])
  end
end
