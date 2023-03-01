class DishFetcherService
  def self.fetch_dishes_to_order(ingredient_ids)
    all_dishes = Dish.all
    rejected_dishes = Dish.joins(:ingredients).where(ingredients: { id: ingredient_ids })

    (all_dishes - rejected_dishes)
  end

  def self.fetch_number_of_ordered_dishes
    dishes = []

    Order.includes(:dishes).all.each do |order|
      dishes << order.dishes
    end

    return if dishes.empty?

    dishes.flatten.group_by(&:itself)
          .sort_by { |_k, v| -v.size }
          .map do |k, v|
      { name: k.name, count: v.count }
    end
  end
end
