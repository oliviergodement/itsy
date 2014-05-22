class ShoppingCartsController < ApplicationController

  before_action :extract_shopping_cart


  def create
    # first creates a shopping cart (cf before_action), then adds the product
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, @product.price)
    redirect_to shopping_cart_path
  end

  def show
  end

  def destroy
    @shopping_cart.shopping_cart_items.find(params[:product_id]).destroy
    redirect_to shopping_cart_path
  end

  private

  def extract_shopping_cart
    if session[:shopping_cart_id]
      @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    else
      @shopping_cart = ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
    end
  end

end

