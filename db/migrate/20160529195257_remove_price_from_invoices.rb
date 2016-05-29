class RemovePriceFromInvoices < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :price
  end

  def self.down
    add_column :invoices, :price, :decimal
  end
end
