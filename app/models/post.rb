class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy # Post.commentsで、投稿が所有するコメントを取得できる。

  validates :title, presence: true
  validates :body, presence: true
end
