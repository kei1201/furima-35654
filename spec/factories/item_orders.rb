FactoryBot.define do
  factory :item_order do
    token          {'tok_abcdefghijk000010000000000000'}
    postal_code    {'123-4567'}
    prefecture_id  {3}
    city_name      {'福岡市'}
    block_name     {'1-1-1'}
    building_name  {'建物ビル'}
    phone_number   {'09022223333'}
  end
end
