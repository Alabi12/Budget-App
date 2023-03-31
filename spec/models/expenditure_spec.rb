require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      expenditure = Expenditure.new(name: 'John')
      expect(expenditure.name.present?).to eq(true)
    end
    it 'ensure amount presence' do
      expenditure = Expenditure.new(name: 'John', amount: 100)
      expect(expenditure.amount.present?).to eq(true)
    end
  end
end
