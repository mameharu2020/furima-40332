FactoryBot.define do
  factory :order_shipping_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 28 }
    city { '大阪市西成区' }
    addresses { '2-7-7' }
    building { '路木' }
    phone_number { '07012345678' }
  end
end
