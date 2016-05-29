class RemoveDescriptionFromInvoices < ActiveRecord::Migration
  def self.up
    remove_column :invoices, :description
  end

  def self.down
    add_column :invoices, :description, :string
  end
end
