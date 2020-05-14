class CartProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    
	  record.cart.user == user    	
  end

   #  private

  	# def user_is_owner?
   #  	record.user == user
  	# end
end
