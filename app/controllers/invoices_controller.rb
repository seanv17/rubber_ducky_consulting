class InvoicesController < ApplicationController
​
  def index
    @invoices = Invoice.all
    render :index
  end
​
  def show
    @invoice = Invoice.find(params[:id])
    render :show
  end
​
  def new
    @invoice = Invoice.new
    render :new
  end
​
  def create
    invoice = Invoice.new(invoice_params)
    if invoice.save
      redirect_to invoice_path(invoice)
    end
  end
​
  def edit
    @invoice = Invoice.find(params[:id])
  end
​
  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoice_path, notice: 'Invoice was successfully updated.'
    else
      flash[:error] = invoice.errors.full_messages_to_sentence
      render :edit
    end
  end
​
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end
​
  private
​
  def invoice_params
    params.require(:invoice).permit(:client_name, :project_name, :project_summary, :amount_due, :date, :image)
  end
​
end
