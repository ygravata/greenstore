class ProductsController < ApplicationController
  def index
  # <h1><%= params[:category].present? ? params[:category] : "All weed" %></h1>
    if params[:category].present?
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
  end
	def new
    	@product = Product.new
  end

  def create
  		@product = Product.new(product_params)
  		@product.save
  end

	private

	def product_params
		params.require(:product).permit(:name, :description, :price, :quantity, :category)
	end
end




