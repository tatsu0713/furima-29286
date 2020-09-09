FactoryBot.define do
  factory :item do
    name                  {'hoge'}
    explanation           {'aaa'}
    category_id           {2}
    item_status_id        {2}
    item_burden_id        {2}
    delivery_area_id      {2}
    shipping_day_id       {2}
    selling_price         {500}
    user
  end
end
