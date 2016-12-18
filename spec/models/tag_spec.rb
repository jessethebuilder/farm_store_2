require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:t){ build :tag }

  describe 'Validations' do
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }
  end

  describe 'Associations' do
    it{ should have_many(:products).through(:taggings) }
  end

  describe 'Idioms' do
    it 'should use farm_slugs' do
      t.name = 'A Product Name'
      t.save
      t.slug.should == 'a-product-name'
      Tag.find('a-product-name').should == t
    end
  end
end
