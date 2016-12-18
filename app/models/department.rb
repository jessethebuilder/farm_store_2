class Department < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true

  use_farm_slugs
end
