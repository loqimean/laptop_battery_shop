FactoryBot.define do
  factory :promocode do
    code { "SOFTSERVE" }
    discount { 10 }
    discount_is_fixed { false }
  end
end
