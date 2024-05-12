class BabyFood < ApplicationRecord
  belongs_to :user
  validates :dish_name, presence: true
  validates :meal_time, presence: true
end
