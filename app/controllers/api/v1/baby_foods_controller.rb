class Api::V1::BabyFoodsController < ApplicationController
  before_action :authenticate_token
  before_action :set_user
  before_action :set_baby_food, only: [:show, :update, :destroy]

  def index
    baby_foods = @user.baby_foods.order(created_at: :DESC)
    render json: baby_foods
  end

  # createアクションで関連付けられたUserを持つBabyFoodオブジェクトを作成
  def create
    baby_food = @user.baby_foods.build(baby_food_params)

    if baby_food.save
      render json: baby_food, status: :ok
    else
      render json: { error: "登録失敗: 何らかの問題が発生しました" }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_baby_food
    @baby_food = @user.baby_foods.find(params[:id])
  end

  def baby_food_params
    params.require(:baby_food).permit(:meal_category, :dish_name, :meal_time, :url, :memo, :meal_date)
  end
end
