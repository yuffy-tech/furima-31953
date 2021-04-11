FactoryBot.define do
  factory :item do
    name               {"任天堂スイッチ"}
    text               {"未使用で、誰も使わなかった"}
    category_id        {2}
    status_id          {2}
    delivery_burden_id {2}
    start_area_id      {2}
    delivery_day_id    {2}
    price              {20000}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
