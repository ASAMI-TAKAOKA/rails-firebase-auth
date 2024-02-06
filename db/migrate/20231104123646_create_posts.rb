class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.string :user_uid, null: false

      t.timestamps
    end
  end
end
