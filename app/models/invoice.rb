class Invoice < ActiveRecord::Base

belongs_to :user

validates :client_Name, :project_name, :project_summary, :amount_due, :date,
  presence: true

validates :project_summary.
  length: {maximum: 255}

validates :status, inclusion: { in: [true, false] }

end
