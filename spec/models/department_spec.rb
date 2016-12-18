require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:d){ build :department }

  describe 'Validations' do
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }
  end

  describe 'Associations' do
    it{ should have_many(:products) }
  end

  describe 'Idioms' do
    it 'should use farm_slugs' do
      d.name = 'A Product Name'
      d.save
      d.slug.should == 'a-product-name'
      Department.find('a-product-name').should == d
    end
  end
end
