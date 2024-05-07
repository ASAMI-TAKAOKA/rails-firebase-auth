Rails.application.routes.draw do
  namespace :api, format: "json" do
    namespace :v1 do
      post "/auth", to: "authentications#create"
      resources :posts do
        resources :comments  #commentsコントローラへのルーティング
      end
      resources :baby_foods
      #カテゴリー分けに関係するところのみ記載
      get 'posts/house_work' => 'posts#house_work'
      get 'posts/money' => 'posts#money'
      get 'posts/baby_food' => 'posts#baby_food'
      get 'posts/childbirth' => 'posts#childbirth'
      get 'posts/breastfeeding' => 'posts#breastfeeding'
      get 'posts/sleeping' => 'posts#sleeping'
      get 'posts/goods' => 'posts#goods'
    end
  end
end