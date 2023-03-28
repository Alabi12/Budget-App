class Expenditure < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :author, class_name: "User"

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
