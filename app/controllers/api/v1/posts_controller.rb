class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_token, only: %i[index show]
  before_action :set_post, only: %i[update destroy]

  def index
    posts = Post.all.order(created_at: :DESC)
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    comments = post.comments
    render json: { post: post, comments: comments }
    # comments = post.comments  #投稿詳細に関連づけてあるコメントを全取得
    # comment = current_user.comments.new  #投稿詳細画面でコメント投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      render json: post
    else
      render_400(nil, post.errors.full_messages)
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render_400(nil, @post.errors.full_messages)
    end
  end

  def destroy
    @post.destroy!
    render json: { message: "Post deleted successfully" }, status: :ok
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :body, :category)
      .merge(user_uid: current_user.uid)
  end
end