require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:p){ build :product }

  describe 'Validations' do
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }

    it{ should validate_presence_of :price }
    it{ should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

    it{ should validate_numericality_of(:units_in_stock).is_greater_than_or_equal_to(0).allow_nil }

    it{ should validate_numericality_of(:height).is_greater_than_or_equal_to(0).allow_nil }
    it{ should validate_numericality_of(:length).is_greater_than_or_equal_to(0).allow_nil }
    it{ should validate_numericality_of(:width).is_greater_than_or_equal_to(0).allow_nil }
    it{ should validate_numericality_of(:weight).is_greater_than_or_equal_to(0).allow_nil }
  end

  describe 'Associations' do
    it{ should have_many(:tags).through(:taggings) }
    it{ should belong_to(:department) }

    it{ should have_many :options }

    describe "Price Variants" do
      it{ should have_many :price_variants }

      specify 'Total of negative price variants should not be greater than :price' do
        p.price_variants << build(:price_variant, adjustment: -50)
        p.price_variants << build(:price_variant, adjustment: -50)
        p.price = 99
        p.save!

        p.valid?.should == false
        p.errors[:price_variants].
                include?("total negative price variants cannot exceed price").should == true
      end
    end
  end

  describe 'Idioms' do
    it 'should use farm_slugs' do
      p.name = 'A Product Name'
      p.save
      p.slug.should == 'a-product-name'
      Product.find('a-product-name').should == p
    end
  end
end
