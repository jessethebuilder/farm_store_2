require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:oi){ build :order_item }
  let(:pv_pos){ build :price_variant, :adjustment => 10 }
  let(:pv_neg){ build :price_variant, :adjustment => -4 }

  describe 'Validations' do
    it{ should validate_presence_of :order }

    it{ should validate_presence_of :product }

    it{ should validate_presence_of :quantity }
    it{ should validate_numericality_of(:quantity).is_greater_than_or_equal_to(1) }
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

  describe "Methods" do
    describe "#price" do
      it 'should return the price of the product' do
        oi.price.should == oi.product.price
      end
    end

    describe "#total_of_price_variants" do
      it 'should return the total of adds' do
        oi.price_variants << [pv_neg, pv_pos]
        oi.total_of_price_variants.should == 6
      end
    end

    describe '#total' do
      it 'should return the product of Product price and quantity' do
        oi.product.price = 100
        oi.quantity = 10
        oi.total.should == 1000
      end

      it 'should acocunt for price variants' do
        oi.price_variants << [pv_neg, pv_pos]
        oi.product.price = 100
        oi.quantity = 1
        oi.total.should == 106
      end
    end
  end
end
