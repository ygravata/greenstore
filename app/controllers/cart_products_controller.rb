class CartProductsController < ApplicationController
	def new
		@cart_products = CartProduct.new()
		authorize @cart_product
	end


	def create
		@cart_product = CartProduct.new(cart_product_params)
   		@cart = cart_find


   		if @cart
   			@cart_product.cart = @cart
   		else
   			@cart_product.cart = Cart.new(status: "Active")
   		end

   		authorize @cart_product
   		authorize @cart
    	
    	if @cart_product.save 
      		redirect_to cart_path(@cart), notice: 'Product added to cart!'
   		end
	end


	private

	def cart_product_params
		params.require(:cart_product).permit([:quantity, :product_id])
	end

	def cart_find
		current_user.carts.find_by_status("Active")	
	end 
end
