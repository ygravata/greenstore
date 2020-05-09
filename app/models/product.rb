class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: %w(Flower Edible Seed),
    message:  "Choose one valid category!" }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :quantity, presence: true
end
