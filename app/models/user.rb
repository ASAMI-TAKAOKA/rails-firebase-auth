class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments  #User.commentsで、ユーザーの所有するコメントを取得できる。
  has_many :baby_foods, dependent: :destroy  # Userが所有するBabyFoodを関連付ける
  validates :uid, presence: true, uniqueness: true
end
