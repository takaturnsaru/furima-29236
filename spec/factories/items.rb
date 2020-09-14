FactoryBot.define do
  factory :item do
    name                     {"サッカーボール"}
    explanation              {"新品・未使用です"}
    category                 {1}
    status                   {1}
    shipping_fee             {1}
    shipping_area            {1}
    day_until_shipping       {1}
    price                    {"5000"}
    user
  end
end