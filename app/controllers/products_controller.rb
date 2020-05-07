class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show]


  # Create
	def new
    	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to product_path(@product), notice: 'Product created!'
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




