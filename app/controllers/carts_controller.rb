class CartsController < ApplicationController
	
	def index
		@cart = current_user.carts.find_by_status("Active")
	end

	def update
		
	end

	
end
