require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :categories
  fixtures :users
  fixtures :records

  before do
    @user = User.first
  end

  context 'Relates' do
    it 'categories' do
      expect(@user.categories).to be_truthy
    end

    it 'records' do
      expect(@user.records).to be_truthy
    end
  end

  context 'validates' do
    it 'can create user.' do
      user = User.new
      user.email = 'test@test.com'
      user.password = '12345678'
      user.encrypted_password = "$2a$10$OgmFDX0wXHLlyAvkoaQjXOox3z26G2J1SSSB7.tfU3tCBf23hZ.Pe"
      expect(user.save).to be_truthy
    end

    it 'can destroy user.' do
      user = User.last
      expect(user.destroy).to be_truthy
    end
  end
end
