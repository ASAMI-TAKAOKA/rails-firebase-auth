class Api::V1::BabyFoodsController < ApplicationController

  def index
    baby_foods = BabyFood.all.order(created_at: :DESC)
    render json: baby_foods
  end

  def create
    baby_food = BabyFood.new(baby_food_params)

    if baby_food.save
      render json: { message: "離乳食の献立を登録しました" }, status: :ok
    else
      render json: { error: "登録失敗: 何らかの問題が発生しました" }, status: :unprocessable_entity
    end
  end

  private

  def baby_food_params
    params.require(:baby_food).permit(:meal_category, :dish_name, :meal_time, :url, :memo, :meal_date)
  end
end
