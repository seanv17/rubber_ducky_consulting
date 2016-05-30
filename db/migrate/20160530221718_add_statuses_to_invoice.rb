class AddStatusesToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :status, :boolean
  end
end
