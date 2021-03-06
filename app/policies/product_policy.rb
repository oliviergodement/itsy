class ProductPolicy < Struct.new(:user, :product)
  class Scope < Struct.new(:user, :scope)

    def resolve
      scope
    end
  end
    def create?
      true
    end

    def create_picture?
      true
    end

    def update?
      user == nil ? false : ((product.user_id == user.id) || user.admin?)
    end

    def destroy?
      user == nil ? false : user.admin?
    end

    def new?
      user.id?
    end
end
