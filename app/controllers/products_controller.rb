class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # Create
	def new
    	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
    @product.user_id = 1
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end


  # Read
  def index
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
  end

  def show
  end



	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :quantity, :category, :photo)
	end

  def set_product
    @product = Product.find(params[:id])
  end
end




