class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search]).page(params[:page])
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def cart
    @products = Product.where(id: session[:shopping_cart])
  end

  private

  def product_params
    params.require(:product).permit(:name, :manufacture, :style, :cost, :price, :comment)
  end
end
