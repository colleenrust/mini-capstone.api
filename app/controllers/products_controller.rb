class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end
  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end
  def create
    @product = Product.new(
      name:params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description], created_at: params[:created_at], 
      updated_at: params[:updated_at]
    )
    @product.save
    render :show

    def update 
      @product = Product.find_by(id: params[:id])


      @product.name = params[:name] || product.name
      @product.price = params[:price] || product.price
      @product.image_url = params[:image_url] || product.image_url
      @product.created_at = params[:created_at] || product.created_at

    end
    @product.save
    render :show
  end
end

