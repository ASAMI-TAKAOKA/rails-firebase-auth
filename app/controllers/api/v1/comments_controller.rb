class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.all.order(created_at: :DESC)
    render json: comments
  end

  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      render json: comment
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end