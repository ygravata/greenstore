class CartsController < ApplicationController
	
	def index
		@cart = current_user.carts.find_by_status("Active")

		@total = 0
		if @cart
			@cart.cart_products.each do |cart_product|
				@total += cart_product.product.price 
			end
		end
	end

	def update
		
	end



	
end
