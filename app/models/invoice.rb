class Invoice < ActiveRecord::Base
  belongs_to  :user

  validates :client_name, :project_name, :project_summary, :date,  :amount_due,
    presence: true

  validates :project_summary,
    length: { maximum: 255 }

end
