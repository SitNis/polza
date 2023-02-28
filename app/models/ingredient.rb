class Ingredient < ApplicationRecord
  has_and_belongs_to_many :dishes, dependent: :destroy

  validates :name, uniqueness: true
end
