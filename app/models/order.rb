class Order < ApplicationRecord
  has_and_belongs_to_many :dishes
  has_and_belongs_to_many :ingredients
  # has_many :dishes_order
  # has_many :dishes, through: :dishes_order
  # has_many :ingredients_order
  # has_many :ingredients, through: :ingredients_order
end
