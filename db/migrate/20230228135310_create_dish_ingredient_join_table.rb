class CreateDishIngredientJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dishes, :ingredients do |t|

      t.index [:ingredient_id, :dish_id], unique: true
    end
  end
end
