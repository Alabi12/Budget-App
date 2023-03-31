require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation tests' do
    it 'ensure name presence' do
      category = Category.new(name: 'John')
      expect(category.name.present?).to eq(true)
    end
    it 'ensure icon presence' do
      category = Category.new(name: 'John', icon: 'https://plus.unsplash.com/premium_photo-1674929041956-f9fbbbdcc227?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')
      expect(category.icon.present?).to eq(true)
    end
  end
end