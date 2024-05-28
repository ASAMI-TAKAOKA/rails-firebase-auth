# Userデータの生成
User.create!(
  id: 1,
  uid: "NWAKw2d992f1gsnhYT4D8k7pN2q2"
)


# BabyFoodデータの生成
require 'date'

baby_food_data = []
start_date = Date.parse("2024-06-02")
end_date = Date.parse("2024-06-30")
meal_categories = ["main_dish", "side_dish", "soup"]
meal_times = ["break_fast", "lunch", "dinner"]
dish_names = {
  "break_fast" => ["フレンチトースト", "パンケーキ", "オムレツ", "すりりんご", "小松菜バナナヨーグルト"],
  "lunch" => ["トマトリゾット", "サンドイッチ", "ナポリタン", "豆腐ハンバーグ", "おやき"],
  "dinner" => ["白身魚の団子", "ヒラメがゆ", "かぼちゃうどん", "肉じゃが", "かぼちゃグラタン"]
}

(start_date..end_date).each do |date|
  meal_times.each do |meal_time|
    meal_category = meal_categories.sample
    dish_name = dish_names[meal_time].sample # ランダムに1つの料理名を選択
    baby_food_data << {
      meal_category: meal_category,
      dish_name: dish_name,
      meal_time: meal_time,
      url: "",
      memo: "",
      meal_date: date,
      user_id: 1,
      user_uid: "NWAKw2d992f1gsnhYT4D8k7pN2q2"
    }
  end
end

# データをデータベースに挿入
baby_food_data.each do |food|
  BabyFood.create!(food)
end

puts "BabyFood seed data inserted successfully"

################################################

# Postsデータの生成
post_data = [
  { title: "時短グッズを教えて", body: "家事を簡単に済ませられる便利グッズを教えてください。", category: "goods" },
  { title: "寝不足で辛いです。。。", body: "6ヶ月の息子の夜泣きが続いています。どうしたらぐっすり寝てくれるのでしょうか。。。", category: "sleeping" },
  { title: "赤ちゃんを連れて行けるおすすめのスポットを", body: "教えてください。", category: "outing_with_baby" },
  { title: "もう疲れました", body: "聞いてください。。。", category: "human_relations" },
  { title: "ホットクックのおすすめレシピを教えて", body: "あなたの時短節約レシピを教えてください！", category: "house_work" },
  { title: "便利家電について", body: "ドラム式洗濯乾燥機の購入を検討しています。おすすめを教えてください。", category: "house_work" },
  { title: "ああああああああ", body: "ああああああああ", category: "house_work" },
  { title: "背中スイッチ発動！", body: "抱っこでは寝るけれど、布団に下ろすと泣いてしまいます", category: "sleeping" },
  { title: "授乳回数が多すぎる", body: "娘がちょこちょこ飲みのタイプなので、1日に30回以上もあげています・・・", category: "breastfeeding" },
  { title: "仕事への復帰について", body: "ああああああああ", category: "work" },
  { title: "離乳食を食べさせるのが大変です", body: "自力で食べたいという気持ちが強くなってきて、何でも・・・・", category: "baby_food" },
  { title: "発達についての相談です", body: "9・10ヶ月健診に行ってきました。小児科の先生に・・・・・", category: "developmental" },
  { title: "新NISAについて", body: "毎月いくら積立していますか？", category: "money" },
  { title: "赤ちゃんの発熱について", body: "39度の熱が出ました。", category: "health" },
  { title: "あいうえお", body: "テスト", category: "human_relations" },
  { title: "あああ", body: "あああ", category: "outing_with_baby" },
  { title: "テストタイトル", body: "テスト本文", category: "house_work" }
]

post_data.each do |post|
  Post.create!(
    user_id: 1,
    title: post[:title],
    body: post[:body],
    user_uid: "NWAKw2d992f1gsnhYT4D8k7pN2q2",
    category: post[:category]
  )
end

puts "Post seed data inserted successfully"