require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Validations' do

  end

  describe 'Associations' do
    it{ should belong_to :has_farm_store_accounts }

    it{ should have_many :orders }
  end
end
