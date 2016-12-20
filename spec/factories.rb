FactoryGirl.define do
  sequence(:name){ |n| "The Name of Something #{n}" }

  factory :order_item_add do
  end

  factory :price_variant do
    name
    adjustment { Random.rand(-100..100) }
    product
  end

  factory :option do
    name
    product
  end

  factory :product do
    name
    price { Random.rand(0..10000) }
  end

  factory :department do
    name
  end

  factory :tag do
    name
  end

  factory :account do

  end

  factory :order do
    status %w|open checkout purchased funded delivered recieved returned|.sample
  end

  factory :order_item do
    product
    order
    quantity { Random.rand(1..100) }
  end
end
