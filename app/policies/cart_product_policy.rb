class CartProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
    	create?
  	end

    def create?
		true    	
    end

   #  private

  	# def user_is_owner?
   #  	record.user == user
  	# end
  end
end
