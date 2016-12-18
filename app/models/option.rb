class Option < ApplicationRecord
  belongs_to :product

  validates :product, :presence => true

  validates :name, presence: true

  has_many :order_item_adds
  has_many :order_items, through: :order_item_adds
end
