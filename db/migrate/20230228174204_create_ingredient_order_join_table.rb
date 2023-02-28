class CreateIngredientOrderJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :ingredients, :orders do |t|

      t.index [:order_id, :ingredient_id], unique: true
    end
  end
end
