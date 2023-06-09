class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  def index
    @product = Product.all
    render:show
  end
  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end
  def create
    @product = Product.new(
      name:params[:name],
      price: params[:price],
      description: params[:description], created_at: params[:created_at], 
      updated_at: params[:updated_at],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      @image = Image.new(
        url: params[:image_url],
        product_id: @product_id
      )
      @image.save!
      render :show
    else 
      render json: {errors:@product.errors.full_messages},status:
      :unprocessable_entity
    end
  end
  # def update 
  #   @product = Product.find_by(id: params[:id])

  #   @product.name = params[:name] || product.name
  #   @product.price = params[:price] || product.price
  #   @product.image_url = params[:image_url] || product.image_url
  #   @product.created_at = params[:created_at] || product.created_at
  #   @product.save
  #   render :show
  
  # end
  # def destroy
  #   @product = Product.find_by(id: params[:id])
  #   @product.destroy
  #   render json: {message:"Product has been successfully removed"}
  # end
end

