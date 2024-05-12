class AddUserIdAndUserUidToBabyFoods < ActiveRecord::Migration[7.1]
  def change
    add_reference :baby_foods, :user, null: false, foreign_key: true
    add_column :baby_foods, :user_uid, :string, null: false
  end
end