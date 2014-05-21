class ProductPolicy < Struct.new(:user, :product)
  class Scope < Struct.new(:user, :scope)

    def resolve
      scope
    end
  end
    def create?
      true
    end

    def update?
      product.user_id == user.id
    end

    def destroy?
      user.admin?
    end
end
