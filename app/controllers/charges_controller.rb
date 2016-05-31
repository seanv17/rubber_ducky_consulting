class ChargesController < ApplicationController

  def new
  end

  def create

    stripe.api_key = 'sk_test_ZBpUa47gRub5LjhWS5a3ORMI'

    token = params[:stripeToken]
    @amount = amount

    customer = Stripe::Customer.create(
      :source => token,
      :email  => params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      :amount       => @amount,
      :customer     => customer.id,
      :currency     => 'usd',
      :description  => 'Rails Stripe customer'
    )

  rescue Stripe::cardError => e
    flash[:error] = e.message
    redirect_to invoices_path
  end


end
