require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  describe 'associations' do
    it { should belong_to(:bearer) }
  end
end
