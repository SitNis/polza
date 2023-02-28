class CreateDishOrderJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dishes, :orders do |t|

      t.index [:order_id, :dish_id], unique: true
    end
  end
end
