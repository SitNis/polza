class Ingredient < ApplicationRecord
  has_and_belongs_to_many :dishes
  has_and_belongs_to_many :orders

  # has_many :ingredients_order
  # has_many :orders, through: :ingredients_order

  validates :name, uniqueness: true
end
