require 'rails_helper'

RSpec.describe OrderItemAdd, type: :model do
  describe "Valildations" do
  end

  describe "Associations" do
    it{ should belong_to :order_item }

    it{ should belong_to :price_variant }

    it{ should belong_to :option }
  end
end
