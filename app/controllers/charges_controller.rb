class ChargesController < ApplicationController

  def new
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
  end

  def create
    # Amount in cents
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    @amount = (@shopping_cart.total * 100).to_i

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
