require 'rails_helper'

RSpec.describe Option, type: :model do
  let(:o){ build :option }

  describe "Validations" do
    it{ should validate_presence_of :name }

    it{ should validate_presence_of :product }
  end

  describe "Associations" do
    it{ should belong_to :product }

    it 'should be destroyed when :product is destroyed' do
      p = o.product
      p.destroy

      o.persisted?.should == false
    end

    it{ should have_many(:order_items).through(:order_item_adds) }
  end
end
