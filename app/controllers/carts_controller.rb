class CartsController < ApplicationController
	
	def index
		@cart = current_user.carts.find_by_status("Active")

		@total = 0
		if @cart
			 @cart.cart_products.each do |cart_product|
			 		@total += cart_product.product.price * cart_product.quantity 
			end
		end
	end

	def update
		@cart = current_user.carts.find_by_status("Active")
		authorize @cart
    @cart.update(cart_params)
    redirect_to cart_path #duvidaa
	end

	def show
		@cart = current_user.carts.last
		authorize @cart
	end

	private

	def cart_params
		params.require(:cart).permit(:status)
	end
	
end
