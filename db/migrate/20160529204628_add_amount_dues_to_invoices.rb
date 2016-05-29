class AddAmountDuesToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :amount_due, :decimal
  end
end
