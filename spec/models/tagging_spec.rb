require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'Associations' do
    it{ should belong_to :tag }
    it{ should belong_to :product }
  end
end
