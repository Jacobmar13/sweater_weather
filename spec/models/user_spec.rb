require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:api_keys) }
    it { should have_secure_password }
  end

  describe 'validations' do
    subject { FactoryBot.create(:user) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
