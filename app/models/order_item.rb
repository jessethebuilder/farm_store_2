class OrderItem < ApplicationRecord
  belongs_to :order

  validates :order, presence: true

  belongs_to :product
  validates :product, presence: true

  has_many :order_item_adds
  has_many :options, through: :order_item_adds

  has_many :price_variants, through: :order_item_adds

  validates :quantity, presence: true,
                       numericality: {greater_than_or_equal_to: 1,
                                      only_integer: true}

  def total
    (self.total_of_price_variants + price) * quantity
  end

  def total_of_price_variants
    self.price_variants.inject(0){ |sum, pv| pv.adjustment + sum }
  end

  def price
    self.product.price
  end
end
