class Order < ApplicationRecord
  include TaxRater
  belongs_to :account

  has_many :order_items, dependent: :destroy

  STATUSES = %w|open checkout purchased funded delivered recieved returned|

  validates :status, presence: true, inclusion: {in: STATUSES}

  def total
    self.order_items.inject(0){ |sum, oi| oi.total + sum }
  end

  def total_plus_tax
    total * (1 + tax_rate)
  end
end
