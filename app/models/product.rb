class Product < ActiveRecord::Base
  belongs_to :user
  has_many :sales

  # Stripe does not allow charges less than $0.50.
  validates_numericality_of :price,
    greater_than: 49,
    message: "must be at least 50 cents"


end
