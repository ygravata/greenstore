class CartProductsController < ApplicationController
	def create
		@cart_product = CartProduct.new(cart_product_params)
 		@cart = cart_find


 		unless @cart
 			@cart = Cart.new(status: "Active", user: current_user)
 			@cart.save
 		end

 		@cart_product.cart = @cart
 		@cart_product.product = Product.find(params[:product_id]) 

 		authorize @cart_product
 		
  	
  	if @cart_product.save 
    		redirect_to carts_path, notice: 'Product added to cart!'
 		end
	end


	private

	def cart_product_params
		params.require(:cart_product).permit(:quantity)
	end

	def cart_find
		current_user.carts.find_by_status("Active")	
	end 
end
