class Dish < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :orders

  # has_many :dishes_order
  # has_many :orders, through: :dishes_order

  validates :name, uniqueness: true
end
