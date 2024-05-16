class Api::V1::BabyFoodsController < ApplicationController
  skip_before_action :authenticate_token, only: %i[index]
  before_action :set_baby_food_data, only: %i[update destroy]

  def index
    baby_foods = BabyFood.all.order(created_at: :DESC)
    render json: baby_foods
  end

  def create
    # baby_foodsは、Userモデルのhas_many :baby_foodsから来ている
    baby_food = current_user.baby_foods.new(baby_food_params)
    if baby_food.save
      render json: { message: "離乳食の献立を登録しました" }, status: :ok
    else
      render json: { error: "登録失敗: 何らかの問題が発生しました" }, status: :unprocessable_entity
    end
  end

  def update
    if @baby_food.update(baby_food_params)
      render json: @baby_food
    else
      render_400(nil, @baby_food.errors.full_messages)
    end
  end

  def destroy
    @baby_food.destroy!
    render json: { message: "Baby Food Data was deleted successfully" }, status: :ok
  end

  private

  def set_baby_food_data
    @baby_food = current_user.baby_foods.find(params[:id])
  end

  def baby_food_params
    params
      .require(:baby_food)
      .permit(:meal_category, :dish_name, :meal_time, :url, :memo, :meal_date)
      .merge(user_uid: current_user.uid)
  end
end
