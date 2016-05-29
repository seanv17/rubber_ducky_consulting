class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :client_name
      t.string :project_name
      t.string :project_summary
      t.decimal :amount_due
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
