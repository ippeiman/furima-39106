FactoryBot.define do
  factory :postage_form do
    #user_id { Faker::Number.non_zero_digit }
    #item_id { Faker::Number.non_zero_digit }
    post_code { '123-4567' }
    shipping_area_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012341234' }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end