class ChargesController < ApplicationController

  def new
  end

  def create

    amount = params[:stripeAmount].to_i * 100
    Stripe.api_key = "sk_test_PBG7t6ioRODdf7GSj2mrgQGo"

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      card:  params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer     => customer.id,
      :amount       => amount,
      :currency     => 'usd',
      :description  => params[:description]
    )

    puts charge

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to invoices_path
  end


end
