class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id:params[:user_id],
      product_id:params[:product_id],
      category_id: params[:category_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: params[:order_id]
    )
    @carted_product.save
  end
  def index
    @carted_products = CartedProduct.all
    render :index
  end
  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.destroy
    render json: {message:"Cart removed"}
  end
end
