FactoryBot.define do
  factory :user do
    nickname { 'sample' }
    email { 'sample@sample' }
    password { 'pass1234' }
    password_confirmation { password }
    first_name { '太郎' }
    last_name { '山田' }
    first_name_reading { 'タロウ' }
    last_name_reading { 'ヤマダ' }
    birth_date { '2000/1/1' }
  end
end
