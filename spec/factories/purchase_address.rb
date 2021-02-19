FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk12345678912345678' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '京都市' }
    house_number { '青山1-1' }
    building_number { '柳ビル' }
    phone_number { '09012345678' }
  end
end
