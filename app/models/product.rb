class Product < ApplicationRecord
  belongs_to :department

  has_many :taggings
  has_many :tags, through: :taggings

  validates :name, presence: true, uniqueness: true

  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}

  validates :units_in_stock, numericality:{greater_than_or_equal_to: 0, allow_nil: true}

  validates :weight,  numericality:{greater_than_or_equal_to: 0, allow_nil: true}
  validates :height,  numericality:{greater_than_or_equal_to: 0, allow_nil: true}
  validates :length,  numericality:{greater_than_or_equal_to: 0, allow_nil: true}
  validates :width,  numericality:{greater_than_or_equal_to: 0, allow_nil: true}

  has_many :order_items, dependent: :destroy

  has_many :options, dependent: :destroy

  has_many :price_variants, dependent: :destroy

  use_farm_slugs

  validate :neg_price_variants_cannot_exceed_price

  def total_negative_adjustments
    neg = self.price_variants.negative.inject(0){ |sum, pv| sum + pv.adjustment }
    neg * (-2 + neg)
  end

  def neg_price_variants_cannot_exceed_price
    if self.total_negative_adjustments > self.price.to_f
      self.errors.add(:price_variants,
                      "total negative price variants cannot exceed price")
    end
  end
end
