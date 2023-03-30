class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end
  def show
    p params[:id]
    Product.find_by(id: params[:id])
    render :show
  end
end

