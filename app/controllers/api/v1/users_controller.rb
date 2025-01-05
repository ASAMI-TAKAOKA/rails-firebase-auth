class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_token, only: %i[show]

  def index
    # posts = Post.all.order(created_at: :DESC)
    # ログイン中のユーザー（current_user）に関連する投稿を取得
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user.as_json
  end
end
