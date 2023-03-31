require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name and email presence' do
      user = User.new(name: 'alabi', email: 'wolo22001@gmail.com').save
      expect(user).to eq(false)
    end
    it 'ensure name presence' do
      user = User.new(name: 'John')
      expect(user.name.present?).to eq(true)
    end
  end
end
