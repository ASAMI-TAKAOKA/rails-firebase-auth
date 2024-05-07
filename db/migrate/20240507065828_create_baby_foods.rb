class CreateBabyFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :baby_foods do |t|
      t.string :meal_category
      t.string :dish_name
      t.string :meal_time
      t.string :url
      t.string :memo

      t.timestamps
    end
  end
end
