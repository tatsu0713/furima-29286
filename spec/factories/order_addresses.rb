FactoryBot.define do
  factory :order_address do
    token               { '333' }
    post_number         { '333-3333' }
    delivery_area_id    { 2 }
    municipality        { '名古屋市中区' }
    address             { '1-1' }
    building            { '名古屋ハイツ' }
    phone_number        { '09012345678' }
  end
end
