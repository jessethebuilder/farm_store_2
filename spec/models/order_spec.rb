require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:o){ build :order }

  describe 'Validations' do
    it{ should validate_presence_of :status }
    it{ should validate_inclusion_of(:status).in_array(Order::STATUSES) }
  end

  describe 'Associations' do
    it{ should belong_to :account }
    it{ should have_many :order_items }
  end

  describe 'Attributes' do
    describe ':status' do
      it 'should default to "open"' do
        Order.new.status.should == 'open'
      end
    end
  end
end
