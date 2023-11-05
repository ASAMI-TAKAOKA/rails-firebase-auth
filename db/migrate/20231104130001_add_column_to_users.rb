class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :uid, unique: true
  end
end
