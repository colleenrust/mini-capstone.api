class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id:params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    @carted_product.save
    render :show
  end
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end
  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.destroy
    render json: {message:"Cart removed"}
  end
end
