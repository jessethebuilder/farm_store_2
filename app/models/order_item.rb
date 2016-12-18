class OrderItem < ApplicationRecord
  belongs_to :order

  validates :order, presence: true

  belongs_to :product
  validates :product, presence: true

  has_many :order_item_adds
  has_many :options, through: :order_item_adds

  has_many :price_variants, through: :order_item_adds
end
