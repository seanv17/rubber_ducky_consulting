class InvoicesController < ApplicationController

  def index
    if current_user[:role] == User.roles[:admin]
    @invoices = Invoice.all.sort_by { |a| a.status ? 1 : 0 }
    else
      @invoices = current_user.invoices.sort_by { |a| a.status ? 1 : 0 }
    end
  end

  def show
    if current_user
      @invoice = Invoice.find(params[:id])
    else
      redirect_to invoices_path
    end
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user_id = current_user.id
    if @invoice.save
      redirect_to invoice_path(@invoice)
      flash[:notice] = "Invoice successfully created"
    else
      flash[:error] = @invoice.errors.full_messages.join(" , ")
      render :new
    end
  end

  def edit
    @invoice = Invoice.find_by_id(params[:id])
  end

  def update
    @invoice = Invoice.find_by_id(params[:id])
    if @invoice.update(invoice_params)
      flash[:notice] = "Invoice was successfully updated"
      redirect_to invoice_path
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
    params.require(:invoice).permit(:client_name, :date, :project_name, :project_summary, :amount_due, :status, :user_id)
  end

end
