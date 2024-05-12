class AddUserIdToBabyFoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :baby_foods, :user, null: false, foreign_key: true
  end
end
