class AddDateToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :date, :date
  end
end
