class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
    @invoice = Invoice.new
  end

  def create
    invoice = Invoice.new(invoice_params)
    if invoice.save
      redirect_to invoice_path(invoice)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit(:client_name, :date, :project_name, :project_summary, :amount_due)
  end

end
