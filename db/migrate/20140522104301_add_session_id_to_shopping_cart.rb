class AddSessionIdToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :session_id, :string
  end
end
