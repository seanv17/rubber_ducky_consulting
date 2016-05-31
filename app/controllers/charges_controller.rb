class ChargesController < ApplicationController

  def new
  end

  def create
    #
    # Stripe.api_key = 'sk_test_ZBpUa47gRub5LjhWS5a3ORMI'
    #
    amount = params[:stripeAmount].to_i
    Stripe.api_key = "pk_test_wZNOidoqT5EW8udvUNuJpggy"

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card:  params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer     => customer.id,
      :amount       => amount,
      :currency     => 'usd',
      :description  => 'Rails Stripe customer'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to invoices_path
  end


end
