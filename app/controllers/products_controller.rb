class ProductsController < ApplicationController
  respond_to :html, :json

  def show
    render :show
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    respond_with(@product)
  end

  def edit
  end

  def updated
  end

end
