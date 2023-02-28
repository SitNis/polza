class DishFetcherService
  def self.fetch(ingredient_ids)
    all_dishes = Dish.all
    rejected_dishes = Dish.joins(:ingredients).where( ingredients: { id: ingredient_ids })

    (all_dishes - rejected_dishes)
  end
end
