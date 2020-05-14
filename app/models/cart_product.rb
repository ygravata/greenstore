class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true 
end
