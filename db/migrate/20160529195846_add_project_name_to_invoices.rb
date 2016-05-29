class AddProjectNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :project_name, :string
  end
end
