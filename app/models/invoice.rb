class Invoice < ActiveRecord::Base

belongs_to :user

validates :user_id, :date, :project_name, :project_summary, :amount_due,
  presence: true, on: :create

validates :project_summary,
  length: {maximum: 255}

validates :status, inclusion: { in: [true, false] }

end
