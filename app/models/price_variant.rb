class PriceVariant < ApplicationRecord
  belongs_to :product

  validates :product, presence: true

  has_many :order_item_adds
  has_many :order_items, through: :order_item_adds

  validates :name, presence: true

  validates :adjustment, presence: true, numericality: true

  def self.positive
    where("adjustment >= ?", 0)
  end

  def self.negative
    where("adjustment < ?", 0)
  end
end
