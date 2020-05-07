class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
