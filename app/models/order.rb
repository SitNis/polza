class Order < ApplicationRecord
  has_and_belongs_to_many :dishes
  validates_presence_of :dishes

  def ingredient_ids
    Ingredient.all.pluck(:id)
  end
end
