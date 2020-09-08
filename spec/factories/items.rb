FactoryBot.define do
  factory :item do
    name                  {"hoge"}
    explanation           {"aaa"}
    category_id           {0}
    item_status_id        {0}
    item_burden_id        {0}
    delivery_area_id      {0}
    shipping_day_id       {0}
    selling_price         {500}
    user
    
  end
end
