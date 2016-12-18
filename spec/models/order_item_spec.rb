require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:oi){ build :order_item }

  describe 'Validations' do
    it{ should validate_presence_of :order }
  end

  describe 'Associations' do
    it{ should belong_to :order }

    it{ should belong_to :product }

    it "Should be Destroyed when Order is Destroyed" do
      o = create :order
      o.order_items << oi
      o.destroy
      oi.destroyed?.should == true
    end

    it{ should have_many(:options).through(:order_item_adds) }

    it{ should have_many(:price_variants).through(:order_item_adds) }
  end
end
