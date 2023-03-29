class ProductsController < ApplicationController
  def singular
    @product = Product.find_by(id: 6)
    render template: "products/show"
  end
  def index
    p params[:id]
    @products = Product.all
    render template: "product/index"
  end
end

