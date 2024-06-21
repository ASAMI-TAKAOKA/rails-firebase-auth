class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_token, only: %i[index show]
  before_action :set_post_data, only: %i[update destroy]

  def index
    posts = Post.all.order(created_at: :DESC)
    render json: posts
  end

  def show
    post = Post.includes(:comments).find(params[:id])
    render json: post.as_json(include: :comments) # postに関連したcommentsが含まれたJSONレスポンスを返す
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

  # privateメソッドは外部から直接アクセスできないため、セキュリティが向上する
  # ヘルパーメソッドや内部処理用のメソッドとして使われることを明示する意味もある
  # コードの意図がより明確になる
  private

  # set_post_dataメソッドは、コントローラ内部でのみ使用される補助的なメソッド。
  # privateとして定義することで、外部からこのメソッドが呼び出されるのを防ぐ（カプセル化の一環）。
  def set_post_data
    # インスタンス変数（@post）に代入することにより、その変数がコントローラ全体で使用可能になる。
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :body, :category)
      .merge(user_uid: current_user.uid)
  end
end