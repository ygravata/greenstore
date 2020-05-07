class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
