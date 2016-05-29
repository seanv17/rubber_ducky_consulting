class AddProjectSummaryToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :project_summary, :string
  end
end
