class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    if
      current_user[:role] == User.roles[:admin]
      @invoices = Invoice.all.sort_by { |a| a.status ? 1 : 0 }
    else
      @invoices = current_user.invoices.sort_by { |a| a.status ? 1 : 0 }
    end
  end

  def show
    invoice = Invoice.find(params[:id])

    if current_user.id == invoice.user_id || current_user[:role] == User.roles[:admin]
      @invoice = Invoice.find(params[:id])
    else
      redirect_to invoices_path
    end
  end

  def new
    if
      current_user[:role] == User.roles[:admin]
      @invoice = Invoice.new
    else
      flash[:error] = "Not authorized"
      redirect_to invoices_path
    end
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
    if
      current_user[:role] == User.roles[:admin]
      @invoice = Invoice.find_by_id(params[:id])
    else
      flash[:error] = "Not authorized"
      redirect_to invoices_path
    end
  end

  def update
    if
      user_signed_in?
      @invoice = Invoice.find_by_id(params[:id])
    if
      @invoice.update(invoice_params)
      flash[:notice] = "Invoice was successfully updated"
      redirect_to invoice_path
    else
      flash[:error] = @invoice.errors.full_messages.join(", ")
      render :edit
    end
    end
  end

  def destroy
    if
      user_signed_in?
      invoice = Invoice.find_by_id(params[:id])
    if invoice.destroy
      flash[:notice] = "Invoice was successfully deleted"
      redirect_to invoices_path
    else
      flash[:error] = @invoice.errors.full_messages.join(" , ")
      render :edit
    end
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:client_name, :date, :project_name, :project_summary, :amount_due, :status, :user_id)
  end

end
