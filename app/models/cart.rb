class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  #validates only one active
  validates :status, presence: true, inclusion: { in: %w(Active Inactive) }
end
