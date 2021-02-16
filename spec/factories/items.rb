FactoryBot.define do
  factory :item do
    item_name { 'test' }
    item_explain { 'test' }
    item_price { 500 }
    category_id { 1 }
    condition_id { 1 }
    charge_id { 1 }
    prefecture_id { 1 }
    sending_day_id { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-img.png'), filename: 'test-img.png')
    end
  end
end
