class ProductsController < ApplicationController
  respond_to :html, :json

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def index
    render :index
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    respond_with(@product)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
