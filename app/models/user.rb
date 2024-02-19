class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments  #User.commentsで、ユーザーの所有するコメントを取得できる。
  validates :uid, presence: true, uniqueness: true
end
