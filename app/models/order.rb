class Order < ApplicationRecord
  belongs_to :account

  has_many :order_items, dependent: :destroy

  STATUSES = %w|open checkout purchased funded delivered recieved returned|

  validates :status, presence: true, inclusion: {in: STATUSES}
end
