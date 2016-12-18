class Account < ApplicationRecord
  belongs_to :has_farm_store_accounts, polymorphic: true
  
  has_many :orders
end
