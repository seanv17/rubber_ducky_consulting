class ChargesController < ApplicationController

  def new
  end

  def create

    # Set Stripe amount to dynamic amount from Invoice
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

    # Find invoice based on invoice id originally passed in from 'description' Stripe object
    @invoice = Invoice.find(charge[:description])
    if charge[:paid]
      @invoice.update_attribute(:status, true)
    end

    if charge.save
      redirect_to invoices_path
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to invoices_path
  end


end
