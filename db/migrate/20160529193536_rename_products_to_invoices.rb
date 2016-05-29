class RenameProductsToInvoices < ActiveRecord::Migration
  def change
    rename_table :products, :invoices
  end
end
