class CartPolicy < ApplicationPolicy
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

    def show?
    	true
    end

    def destroy?
    	user_is_owner?
    end

    def edit?
    	user_is_owner?
    end


    private

  	def user_is_owner?
    	record.user == user
  	end
  end
end
