class OrderItemAdd < ApplicationRecord
  belongs_to :order_item

  belongs_to :price_variant

  belongs_to :option
end 
