class RemoveStatusFromInvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :status, :boolean
  end
end
