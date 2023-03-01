class Order < ApplicationRecord
  has_and_belongs_to_many :dishes

  def self.fetch_number_of_dishes
    dishes = []

    Order.includes(:dishes).all.each do |order|
      dishes << order.dishes
    end

    dishes.flatten.group_by(&:itself)
          .sort_by {|k, v| -v.size }
          .map do |k,v| { name: k.name, count: v.count }
    end
  end

  def ingredient_ids
    Ingredient.all.pluck(:id)
  end
end
