class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #Anyone can view:
      scope.all
      #Display only products from the owner
      # scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def edit?
    update?
  end


  def create?
    true
  end

  def update?
    user_is_owner?
  end

  def show?
    true
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

end
