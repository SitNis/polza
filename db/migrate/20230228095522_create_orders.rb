class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :count, null: false

      t.timestamps
    end
  end
end
