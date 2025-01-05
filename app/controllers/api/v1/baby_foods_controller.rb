class Api::V1::BabyFoodsController < ApplicationController
  # skip_before_action :authenticate_token, only: %i[index] これがあるとindexが'User not authenticated'となる
  before_action :set_baby_food_data, only: %i[update destroy]

  def index
    # TODO: フロントエンドは問題なく表示されるが、
    # current_userがnilを返し、http://localhost:3001/api/v1/baby_foods/にアクセスすると
    # 'User not authenticated'を返す
    if current_user.nil?
      render json: { message: 'Unauthorized', errors: ['User not authenticated'] }, status: :unauthorized
      return
    end

    @baby_foods = current_user.baby_foods
                         .order(:meal_date)
                         .order(Arel.sql("CASE WHEN meal_time = 'break_fast' THEN 1 WHEN meal_time = 'lunch' THEN 2 WHEN meal_time = 'dinner' THEN 3 END"))
                         .order(Arel.sql("CASE WHEN meal_category = 'main_dish' THEN 1 WHEN meal_category = 'main_course' THEN 2 WHEN meal_category = 'side_dish' THEN 3 WHEN meal_category = 'soup' THEN 4 WHEN meal_category = 'other' THEN 5 END"))
    render json: @baby_foods
  end

  def show
    baby_food = BabyFood.find(params[:id])
    render json: baby_food
  end

  def create
    # baby_foodsは、Userモデルのhas_many :baby_foodsから来ている
    baby_food = current_user.baby_foods.new(baby_food_params)
    if baby_food.save
      render json: { message: '離乳食の献立を登録しました' }, status: :ok
    else
      render json: { error: '登録失敗: 何らかの問題が発生しました' }, status: :unprocessable_entity
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
    render json: { message: 'Baby Food Data was deleted successfully' }, status: :ok
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
