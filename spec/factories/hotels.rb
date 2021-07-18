FactoryBot.define do
  factory :hotel do
    hotel_name          {"太郎ゲストハウス"}
    description         {"駅から徒歩１５分、共有ラウンジあり、部屋からは海が見えます"}
    postal_code         {"192-0364"}
    prefecture_id       {2}
    city                {"京都市"}
    house_number        {"左京区3-19-3"}
    association         :owner
  end
end
