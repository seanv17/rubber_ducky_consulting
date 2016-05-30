class InvoicesController < ApplicationController

  def index
    if current_user[:role] === User.roles[:admin]
    @invoices = Invoice.all
    else
      @invoices = current_user.invoices
    end
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
    @invoice = Invoice.find_by_id(params[:id])
  end

  def update
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoice_path, notice: "Invoice was successfully updated"
    else
      flash[:error] = @invoice.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    invoice = Invoice.find_by_id(params[:id])
      if invoice.destroy
        flash[:notice] = "Invoice was successfully deleted"
        redirect_to invoices_path
      else
        flash[:error] = @invoice.errors.full_messages.join(" , ")
        render :edit
      end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:client_name, :date, :project_name, :project_summary, :amount_due, :status)
  end

end
