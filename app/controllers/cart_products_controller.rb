class CartProductsController < ApplicationController

	def create
 		@cart = cart_find

 		unless @cart
 			@cart = Cart.new(status: "Active", user: current_user)
 			@cart.save
 		end

 		@cart_product = @cart.cart_products.find_by(product_id: params[:product_id])
 		if @cart_product
 			@cart_product.quantity += cart_product_params[:quantity].to_i
	 	else
	 		@cart_product = CartProduct.new(cart_product_params)
	 		@cart_product.cart = @cart
	 		@cart_product.product = Product.find(params[:product_id])
	 	end
	 	
 		authorize @cart_product
 		
  	if @cart_product.save 
    		redirect_to carts_path, notice: 'Product added to cart!'
 		end
	end

	def destroy
		@cart_product = CartProduct.find(params[:id])
		authorize @cart_product
		@cart_product.destroy
		redirect_to carts_path, notice: 'Product removed from cart'
	end


	private

	def cart_product_params
		params.require(:cart_product).permit(:quantity)
	end

	def cart_find
		current_user.carts.find_by_status("Active")	
	end 
end
