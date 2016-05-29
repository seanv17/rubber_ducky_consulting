class AddClientNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :client_name, :string
  end
end
