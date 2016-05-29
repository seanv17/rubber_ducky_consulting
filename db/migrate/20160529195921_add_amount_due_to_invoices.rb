class AddAmountDueToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :amount_due, :string
  end
end
