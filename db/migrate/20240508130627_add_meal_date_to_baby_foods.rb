class AddMealDateToBabyFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :baby_foods, :meal_date, :date
  end
end
