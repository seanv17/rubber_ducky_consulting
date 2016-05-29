class RemoveNameFromInvoices < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :name
  end

  def self.down
    add_column :invoices, :name, :string
  end
end
