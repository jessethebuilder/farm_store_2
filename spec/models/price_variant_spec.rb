require 'rails_helper'

RSpec.describe PriceVariant, type: :model do
  let(:pv){ build :price_variant }

  describe "Validations" do
    it{ should validate_presence_of :name }

    it{ should validate_presence_of :product }

    it{ should validate_presence_of :adjustment }
    it{ should validate_numericality_of :adjustment }
  end

  describe "Associations" do
    it{ should belong_to :product }

    it 'should be destroyed when product is destroyed' do
      p = pv.product
      p.destroy

      pv.persisted?.should == false
    end

    it{ should have_many(:order_items).through(:order_item_adds) }
  end

  describe 'Scopes' do
    let(:pos_pv){ build :price_variant, adjustment: 10 }
    let(:neg_pv){ build :price_variant, adjustment: -10 }
    let(:product){ build :product }

    before(:each) do
      product.price_variants << pos_pv
      product.price_variants << neg_pv
      product.save!
    end

    describe '#positive' do
      it 'should return negative prices' do
        product.price_variants.positive.count.should == 1
        product.price_variants.positive.first.should == pos_pv
      end
    end

    describe '#negative' do
      it 'should return negative prices' do
        product.price_variants.negative.count.should == 1
        product.price_variants.negative.first.should == neg_pv
      end
    end
  end

  describe "Methods" do
    # describe ":adjusted_price" do
    #   before(:each) do
    #     p = pv.product
    #     p.price = 100
    #   end
    #
    #   it "should add a postive value with base price" do
    #     pv.adjustment = 10.20
    #     pv.adjusted_price.should == 110.20
    #   end
    #
    #   it "should subtract a negative value with base price" do
    #     pv.adjustment = "-10.50"
    #     pv.adjusted_price.should == 89.50
    #   end
    # end
  end
end
